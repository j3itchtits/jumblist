using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Security;
using Microsoft.Practices.ServiceLocation;
using Jumblist.Core.Service.Data;
using Jumblist.Website.Module;
using System.Xml;
using System.ServiceModel.Syndication;
using Jumblist.Website.ViewModel;
using System.Reflection;
using System.Net;
using StuartClode.Mvc.Feeds;
using System.Text.RegularExpressions;

namespace Jumblist.Website.Controllers
{
    public class HomeController : RootControllerBase
    {
        public ViewResult Index()
        {
            return View();
        }

        public ViewResult About()
        {
            return View();
        }

        public ViewResult Help()
        {
            ViewData["Content"] = HttpReader.YahooGroup( "http://groups.yahoo.com/group/hastings-freecycle/messages?xm=1&m=e&l=1", "noostu", "edinburgh" );

            //var feedSource = "</html>\n\n\n<!-- etime: 0.142 -->\n<!-- w9.grp.sp2.yahoo.com uncompressed/chunked Mon Feb  8 09:17:20 PST 2010 -->\n";


            //ViewData["Content"] = Regex.Replace( feedSource, @"\<\!DOCTYPE.*?\>", String.Empty );



            return View();
        }

        public ViewResult Test()
        {

            //XmlReader reader = XmlReader.Create( "http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml" );
            //XmlReader feedSource = XmlReader.Create( "http://search.twitter.com/search.rss?q=haiti" );
            //SyndicationFeed feedOutput = SyndicationFeed.Load( feedSource );

            var feedOutput = (SyndicationFeed)Type.GetType( "StuartClode.Mvc.Feeds.CustomSyndicationFeed, StuartClode.Mvc" )
                .GetMethod( "Load" )
                .Invoke( null, new object[] { "http://search.twitter.com/search.rss?q=haiti", null, null } );

            var feedOutput1 = (SyndicationFeed)Type.GetType( "StuartClode.Mvc.Feeds.BbcCustomHttpFeed, StuartClode.Mvc" )
                .GetMethod( "Load" )
                .Invoke(null, new object[] { "http://news.bbc.co.uk", null, null });

            //var feedOutput2 = (SyndicationFeed)Type.GetType( "StuartClode.Mvc.Feeds.YahooGroupsCustomHttpFeed, StuartClode.Mvc" )
            //    .GetMethod( "Load" )
            //    .Invoke( null, new object[] { "http://groups.yahoo.com/group/hastings-freecycle/messages?xm=1&m=e&l=1", "noostu", "edinburgh" } );


            var feedOutput2 = YahooGroupsCustomHttpFeed.Load( "http://groups.yahoo.com/group/hastings-freecycle/messages?xm=1&m=e&l=1", "noostu", "edinburgh" );

            //string feedSource = HttpReader.Create( "http://www.google.co.uk/ig?hl=en&source=iglk" );
            //string feedSource = HttpReader.Create( "http://www.google.com/calendar/feeds/default/private/full?q=null+item" );

            string feedSource = HttpReader.GoogleAuthManagerExample( "http://www.google.com/calendar/feeds/default/private/full?q=null+item", "theclodes", "Edinb8rgh" );
            //string feedSource = HttpReader.GoogleAuthManagerExample( "https://mail.google.com/mail", "theclodes", "Edinb8rgh" );

            //SyndicationFeed feedOutput = CustomSyndicationFeed.Load( "http://search.twitter.com/search.rss?q=haiti" );
            //SyndicationFeed feedOutput1 = BbcCustomHttpFeed.Load( "http://news.bbc.co.uk/" );

            //var model = DefaultView.Model<SyndicationFeed>().With( feed ).WithPageTitle( "Testing" );
            //var model = TestView.Model().With( feedOutput ).With( feedOutput1 ).WithPageTitle( "Testing testing" );

            //var model = TestView.Model().With( feedOutput ).WithPageTitle( "Testing testing" );
            //var model = TestView.Model().With( feedOutput1 ).With( feedSource ).WithPageTitle( "Testing with custom BBC page" );
            var model = TestView.Model().With( feedOutput2 ).With( feedSource ).WithPageTitle( "Testing with custom Yahoo Groups page" );

            return View( model );
        }

    }

}
