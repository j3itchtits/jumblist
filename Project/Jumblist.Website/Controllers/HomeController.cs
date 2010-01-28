using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Security;
using Microsoft.Practices.ServiceLocation;
using Jumblist.Core.Service.Data;
using Jumblist.Core.Model;
using System.Xml;
using System.ServiceModel.Syndication;
using Jumblist.Website.ViewModel;
using System.Net;
using System.IO;
using Microsoft.Web.Testing.Light;
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
            return View();
        }

        public ViewResult Test()
        {

            //XmlReader reader = XmlReader.Create( "http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml" );
            XmlReader feedSource = XmlReader.Create( "http://search.twitter.com/search.rss?q=haiti" );
            SyndicationFeed feedOutput = SyndicationFeed.Load( feedSource );

            //HttpWebRequest request = WebRequest.Create( "http://news.bbc.co.uk/" ) as HttpWebRequest;
            //request.Method = "GET";
            //HttpWebResponse response = request.GetResponse() as HttpWebResponse;
            //var stream = new StreamReader( response.GetResponseStream() );
            //string feedSource1 = stream.ReadToEnd();

            string feedSource1 = BasicHttpRequestResponse.BasicGetRequest( "http://news.bbc.co.uk/" );
            feedSource1 = Regex.Replace( feedSource1, @"\<\!DOCTYPE.*?\>", String.Empty );

            HtmlElement rootElement = HtmlElement.Create( feedSource1 );

            // identify the div rows
            HtmlElementFindParams findParams1 = new HtmlElementFindParams();
            findParams1.TagName = "div";
            findParams1.Attributes.Add( "class", "wgreylinebottom" );
            findParams1.Index = 0;

            //HtmlElement divModule = rootElement.ChildElements.FindAll( findParams1 )[0];
            HtmlElement divModule = rootElement.ChildElements.Find( findParams1 );

            //// identify the div rows
            HtmlElementFindParams findParams2 = new HtmlElementFindParams();
            findParams2.TagName = "div";
            findParams2.Attributes.Add( "class", "arr" );

            //string feedOutput1 = divModule.CachedInnerTextRecursive;
            string feedOutput1 = string.Empty;

            //find all the post rows
            foreach (HtmlElement div in divModule.ChildElements.FindAll( findParams2 ))
            {
                feedOutput1 += div.CachedInnerTextRecursive + "<br>";
            }

            //var model = DefaultView.Model<SyndicationFeed>().With( feed ).WithPageTitle( "Testing" );
            var model = TestView.Model<SyndicationFeed>().With( feedOutput ).WithPageTitle( feedOutput1 );

            return View( model );
        }
    }
}
