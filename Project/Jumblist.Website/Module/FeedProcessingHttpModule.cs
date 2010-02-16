using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Data;
using System.Xml;
using Jumblist.Website.Module;
using System.ServiceModel.Syndication;
using Jumblist.Core.Service.Data;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Repository;
using Microsoft.Practices.ServiceLocation;
using Jumblist.Core.Model;
using StuartClode.Mvc.Feeds;

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
            //See notes at Steps to importing a feed into the database.txt for further explanation

            //http://bugsquash.blogspot.com/2009/11/windsor-managed-httpmodules.html
            //http://stackoverflow.com/questions/1657473/ioc-dependancy-injection-into-custom-http-module-how-asp-net

            //for each feed in the feed table 
            //we need to loop through setting up a new class each time - FeedContainer
            //this class has many properties that need to be set
            //eg. feedtype, feedurl, feedusername, feedpassword
            //after all properties have been set then we need to have a run method which creates the SyndicationFeed object (using reflection)
            //and then loops through all the items
            //adding a post to the post table for each unique item found



            var feed = YahooGroupsCustomHttpFeed.Load( "http://groups.yahoo.com/group/hastings-freecycle/messages/?xm=1&o=1&m=e&l=1", "noostu", "edinburgh" );

            //var feed = (SyndicationFeed)Type.GetType("StuartClode.Mvc.Feeds.YahooGroupsCustomHttpFeed, StuartClode.Mvc")
            //    .GetMethod("Load")
            //    .Invoke(null, new object[] { "http://groups.yahoo.com/group/hastings-freecycle/messages?xm=1&m=e&l=1", "noostu", "edinburgh" });


            var postService = ServiceLocator.Current.GetInstance<IPostService>();

            var posts = postService.SelectList();

            foreach (var item in feed.Items)
            {
                if (!(postService.IsDuplicate( posts, item.Id )))
                {
                    var post = new Post();
                    post.ParentId = 0;
                    post.Guid = item.Id;
                    post.Url = item.Links[0].Uri.ToString();
                    post.Title = item.Title.Text;
                    post.Body = item.Summary.Text;
                    post.PublishDateTime = item.PublishDate.LocalDateTime;
                    post.LastUpdatedDateTime = item.LastUpdatedTime.LocalDateTime;
                    post.PostCategoryId = 0;
                    post.Display = false;
                    post.UserId = 1;
                    post.FeedId = 1;

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
                var tickDuration = 300000;
                _timer = new Timer( timerCallback, null, startTime, tickDuration );
            }
        }

        #endregion

    }
}
