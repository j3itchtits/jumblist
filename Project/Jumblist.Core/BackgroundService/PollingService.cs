using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Data;
using System.Xml;
using Jumblist.Core.Model;
using System.ServiceModel.Syndication;
using Jumblist.Core.Service.Data;
using StuartClode.Mvc.Service;

namespace Jumblist.Core.BackgroundService
{
    public class PollingService : IHttpModule
    {
        protected static Timer _timer;
        protected static object _semaphore;
        protected static string _value;

        private readonly IPostService postService;

        public PollingService( IPostService postService ) 
        {
            this.postService = postService;
            _semaphore = new object();
        }

        protected void DoWork( object state )
        {
            lock (_semaphore)
            {
                var results = new DataSet();
                results.ReadXml( @"http://weather.yahooapis.com/forecastrss?p=UKXX0085", XmlReadMode.Auto );
                var description = (results.Tables["condition"].Rows[0]["text"]).ToString();
                var temperature = (results.Tables["condition"].Rows[0]["temp"]).ToString();
                var unit = (results.Tables["units"].Rows[0]["temperature"]).ToString();
                _value = String.Format( "{0} {1} degrees {2}", description, temperature, unit );


                //var postService = ServiceLocator.Current.GetInstance<IPostService>();

                XmlReader reader = XmlReader.Create( "http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml" );
                SyndicationFeed feed = SyndicationFeed.Load( reader );

                foreach (var item in feed.Items)
                {
                    var post = new Post();
                    post.ParentId = 0;
                    post.Guid = item.Id;
                    post.Url = item.Links[0].Uri.ToString();
                    post.Title = item.Title.Text;
                    post.Body = item.Summary.Text;
                    post.DateTime = item.PublishDate.LocalDateTime;
                    post.PostCategoryId = 1;
                    post.Display = false;
                    post.UserId = 1;
                    post.FeedId = 1;

                    postService.Save( post );

                }

                reader.Close();

            }
        }

        protected void OnBeginRequest( object sender, EventArgs e )
        {
            lock (_semaphore)
            {
                HttpContext.Current.Items["Temp"] = _value;
            }
        }


        #region IHttpModule Members

        public void Dispose()
        {
            
        }

        public void Init( HttpApplication application )
        {
            application.BeginRequest += OnBeginRequest;

            //There must only ever be 1 instance of Timer class
            if (_timer == null)
            {
                var timerCallback = new TimerCallback( DoWork );
                var startTime = 0;
                //1 second = 1000 ticks
                var tickDuration = 30000;
                _timer = new Timer( timerCallback, null, startTime, tickDuration );
            }
        }

        #endregion
    }
}
