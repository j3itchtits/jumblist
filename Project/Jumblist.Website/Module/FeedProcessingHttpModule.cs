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
using StuartClode.Mvc.Repository;
using Microsoft.Practices.ServiceLocation;
using Jumblist.Core;

namespace Jumblist.Website.Module
{
    public class FeedProcessingHttpModule : IHttpModule
    {
        protected static Timer _timer;
        private static object _lock = new object();
        protected static string _value;
        protected static bool _start = false;

        protected void DoWork( object state )
        {
            


            lock (_lock)
            {
                try
                {
                    CopyRssToHttpContext();
                    SaveRssToDatabase();


                }
                catch (Exception ex)
                {
                    //need to throw an error that can be caught by Elmah - by default the error gets handled by the web server which then crashes
                    //throw ex;
                    return;
                }
            }
        }

        private void CopyRssToHttpContext()
        {
            var results = new DataSet();
            results.ReadXml( @"http://weather.yahooapis.com/forecastrss?p=UKXX0085", XmlReadMode.Auto );
            var description = (results.Tables["condition"].Rows[0]["text"]).ToString();
            var temperature = (results.Tables["condition"].Rows[0]["temp"]).ToString();
            var unit = (results.Tables["units"].Rows[0]["temperature"]).ToString();
            _value = String.Format( "{0} {1} degrees {2}", description, temperature, unit );
        }

        private void SaveRssToDatabase()
        {
            //http://bugsquash.blogspot.com/2009/11/windsor-managed-httpmodules.html
            //http://stackoverflow.com/questions/1657473/ioc-dependancy-injection-into-custom-http-module-how-asp-net

            XmlReader reader = XmlReader.Create( "http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml" );
            //XmlReader reader = XmlReader.Create( "http://search.twitter.com/search.rss?q=haiti" );

            SyndicationFeed feed = SyndicationFeed.Load( reader );
            reader.Close();

            var postService = ServiceLocator.Current.GetInstance<IPostService>();

            var list = postService.SelectList();

            foreach (var item in feed.Items)
            {
                if (!(postService.IsDuplicate( list, item.Id )))
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
                    //post.PostTags = null;
                    //post.PostLocations = null;

                    postService.Save( post );
                }
            }
        }

        protected void OnBeginRequest( object sender, EventArgs e )
        {
            lock (_lock)
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
            if (_timer == null && _start == true)
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
