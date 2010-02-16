using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Website.Filter;
using System.ServiceModel.Syndication;
using StuartClode.Mvc.Feeds;
using Jumblist.Website.ViewModel;
using System.Xml;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevels = RoleLevel.Administrator | RoleLevel.Editor )]
    public class HomeController : RootControllerBase
    {
        [LoadFeeds]
        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult FeedSource()
        {
            string feedSource = XmlReader.Create( "http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml" ).ReadInnerXml();
            string feedSource1 = HttpReader.Create( "http://news.bbc.co.uk" );
            string feedSource2 = HttpReader.YahooGroup( "http://groups.yahoo.com/group/hastings-freecycle/messages?xm=1&m=e&l=1", "noostu", "edinburgh" );

            var model = TestView.Model().With( feedSource2 ).WithPageTitle( "Testing with custom Yahoo Groups page" );

            return View( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult FeedOutput()
        {
            var feedOutput = (SyndicationFeed)Type.GetType("StuartClode.Mvc.Feeds.CustomSyndicationFeed, StuartClode.Mvc")
                .GetMethod("Load")
                .Invoke( null, new object[] { "http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml", null, null } );

            var feedOutput1 = (SyndicationFeed)Type.GetType("StuartClode.Mvc.Feeds.BbcCustomHttpFeed, StuartClode.Mvc")
                .GetMethod("Load")
                .Invoke(null, new object[] { "http://news.bbc.co.uk", null, null });

            var feedOutput2 = (SyndicationFeed)Type.GetType("StuartClode.Mvc.Feeds.YahooGroupsCustomHttpFeed, StuartClode.Mvc")
                .GetMethod("Load")
                .Invoke(null, new object[] { "http://groups.yahoo.com/group/hastings-freecycle/messages?xm=1&m=e&l=1", "noostu", "edinburgh" });


            //var feedOutput2 = YahooGroupsCustomHttpFeed.Load( "http://groups.yahoo.com/group/hastings-freecycle/messages/?xm=1&o=1&m=e&l=1", "noostu", "edinburgh" );

            //string feedSource = HttpReader.Create( "http://www.google.co.uk/ig?hl=en&source=iglk" );
            //string feedSource = HttpReader.Create( "http://www.google.com/calendar/feeds/default/private/full?q=null+item" );

            //feedSource = HttpReader.GoogleAuthManagerExample( "http://www.google.com/calendar/feeds/default/private/full?q=null+item", "theclodes", "Edinb8rgh" );
            //string feedSource = HttpReader.GoogleAuthManagerExample( "https://mail.google.com/mail", "theclodes", "Edinb8rgh" );

            //SyndicationFeed feedOutput = CustomSyndicationFeed.Load( "http://search.twitter.com/search.rss?q=haiti" );
            //SyndicationFeed feedOutput1 = BbcCustomHttpFeed.Load( "http://news.bbc.co.uk/" );

            //var model = DefaultView.Model<SyndicationFeed>().With( feed ).WithPageTitle( "Testing" );
            //var model = TestView.Model().With( feedOutput ).With( feedOutput1 ).WithPageTitle( "Testing testing" );

            //var model = TestView.Model().With( feedOutput ).WithPageTitle( "Testing testing" );
            //var model = TestView.Model().With( feedOutput1 ).With( feedSource ).WithPageTitle( "Testing with custom BBC page" );

            var model = TestView.Model().With( feedOutput2 ).WithPageTitle("Testing with custom Yahoo Groups page");

            return View(model);
        }
    }
}
