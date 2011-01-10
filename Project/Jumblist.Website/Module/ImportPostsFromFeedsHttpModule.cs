using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Data;
using System.Xml;
using Jumblist.Website.Module;
using System.ServiceModel.Syndication;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using Microsoft.Practices.ServiceLocation;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Feed;
using StuartClode.Mvc.Service.Serialization;

namespace Jumblist.Website.Module
{
    public class ImportPostsFromFeedsHttpModule : IHttpModule
    {
        protected static Timer _timer;
        private static object _lock = new object();
        protected static string _value;
        protected static bool _start = true;

        protected void DoWork( object state )
        {
            lock (_lock)
            {
                try
                {
                    //CopyRssToHttpContext();
                    ImportPostsFromFeeds();
                }
                catch (Exception ex)
                {
                    //need to throw an error that can be caught by Elmah - by default the error gets handled by the web server which then crashes
                    //throw ex;
                    return;
                }
            }
        }

        //private void CopyRssToHttpContext()
        //{
        //    var results = new DataSet();
        //    results.ReadXml( @"http://weather.yahooapis.com/forecastrss?p=UKXX0085", XmlReadMode.Auto );
        //    var description = (results.Tables["condition"].Rows[0]["text"]).ToString();
        //    var temperature = (results.Tables["condition"].Rows[0]["temp"]).ToString();
        //    var unit = (results.Tables["units"].Rows[0]["temperature"]).ToString();
        //    _value = String.Format( "{0} {1} degrees {2}", description, temperature, unit );
        //}

        private void ImportPostsFromFeeds()
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

            var feedService = ServiceLocator.Current.GetInstance<IFeedService>();
            var feeds = feedService.SelectRecordList( Feed.WhereIsActiveEquals ( true ) );

            foreach ( var feed in feeds )
            {
                var feedOutput = (SyndicationFeed)Type.GetType( "StuartClode.Mvc.Service.Feed." + feed.Category.Type + ", StuartClode.Mvc" )
                    .GetMethod( "Load" )
                    .Invoke( null, new object[] { feed.Url, feed.Username, feed.Password } );

                SavePostsToDatabase( feed, feedOutput );
            }

            //var feedOutput = YahooGroupsCustomHttpFeed.Load( "http://groups.yahoo.com/group/hastings-freecycle/messages/?xm=1&o=1&m=e&l=1", "noostu", "edinburgh" );

            //var feedOutput = (SyndicationFeed)Type.GetType("StuartClode.Mvc.Service.Feed.YahooGroupsCustomHttpFeed, StuartClode.Mvc")
            //    .GetMethod("Load")
            //    .Invoke(null, new object[] { "http://groups.yahoo.com/group/hastings-freecycle/messages?xm=1&m=e&l=1", "noostu", "edinburgh" });

        }

        private void SavePostsToDatabase( Feed feed, SyndicationFeed feedOutput )
        {
            var postService = ServiceLocator.Current.GetInstance<IPostService>();

            foreach (var item in feedOutput.Items)
            {
                if ( ((IDataService<Post>)postService).IsDuplicate( Post.WhereUrlEquals( item.Links[0].Uri.ToString() ) ) ) 
                    continue;

                var post = new Post();
                //post.Guid = item.Id;
                post.Url = item.Links[0].Uri.ToString();
                post.Title = item.Title.Text;
                post.Body = item.Summary.Text;
                post.PublishDateTime = item.PublishDate.LocalDateTime;
                post.LastUpdatedDateTime = item.LastUpdatedTime.LocalDateTime;
                post.Display = false;
                post.UserId = User.Anonymous.UserId;
                post.FeedId = feed.FeedId;
                post.LastUpdatedDateTime = DateTime.Now;
                post.PostCategoryId = postService.ExtractPostCategoryId( post );

                if ( PostCategoryId.Wanted.Is( post.PostCategoryId ) || PostCategoryId.Offered.Is( post.PostCategoryId ) )
                {
                    postService.Import( post );
                }

                
                
            }
        }

        private void SendUserAlerts()
        {
            IPostService postService = ServiceLocator.Current.GetInstance<IPostService>();
            IDataService<UserAlert> userAlertService = ServiceLocator.Current.GetInstance<IDataService<UserAlert>>();
            IMailService mailService = ServiceLocator.Current.GetInstance<IMailService>();

            //First we need a list of all the active alerts
            IQueryable<UserAlert> alerts = userAlertService.SelectRecordList( x => x.IsActive == true && x.IsImmediateSend == true );

            //Now we need to loop through each alert pulling out the postlist and then filtering by comparing the alert.lastsenttime with the post.lastupdatedtime
            foreach ( UserAlert alert in alerts )
            {
                PostListRouteValues postListRouteValues = (PostListRouteValues)Serializer.Deserialize( alert.PostListRouteValues );
                UserSearchArea userSearchArea = (UserSearchArea)Serializer.Deserialize( alert.SearchArea );

                IEnumerable<Post> postList = postService.RecordList( postListRouteValues, userSearchArea );
                postList = postList.Where( x => x.LastUpdatedDateTime > alert.DateTimeLastSent );

                //We then loop though the postlist (if count > 0) for each alert and send out an email for each post
                if ( postList.Count() > 0 )
                {
                    mailService.SendEmailAlert( alert, postList );

                    //We then need to update each alert lastsenttime 
                    alert.DateTimeLastSent = DateTime.Now;
                    userAlertService.Save( alert );
                }
            }            
        }

        //protected void OnBeginRequest( object sender, EventArgs e )
        //{
        //    lock (_lock)
        //    {
        //        HttpContext.Current.Items["Temp"] = _value;
        //    }
        //}


        #region IHttpModule Members

        public void Dispose()
        {
            
        }

        public void Init( HttpApplication application )
        {
            //application.BeginRequest += OnBeginRequest;

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
