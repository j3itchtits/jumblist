using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Website.Helpers;

namespace Jumblist.Website.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult About()
        {

            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            ViewData["Weather"] = HttpContext.Items["Temp"];

            //string url = "http://groups.yahoo.com/group/hastings-freecycle";
            //string url = "http://www.google.co.uk";
            //string url = "http://stuartclode.co.uk";
            //string url = "http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/tennis/rss.xml";



            //HTTP GET EXAMPLES 1

            string getUrl1 = "http://www.catlingraduates.com/wp-login.php";
            var getResponse1 = new HttpRequestResponse(getUrl1);

            //HTTP GET EXAMPLES 2

            string getUrl2 = "http://www.catlingraduates.com/wp-login.php";
            var getResponse2 = new BasicHttpRequestResponse(getUrl2);
            getResponse2.UserName = "admincatlin";
            getResponse2.Password = "br5GEku7";

            ViewData["GetUrl"] = getUrl1;
            ViewData["GetResponse"] = getResponse1.SendRequest();


            //HTTP POST EXAMPLES

            //string postUrl = "http://api.search.yahoo.com/ContentAnalysisService/V1/termExtraction";

            //Dictionary<string, string> sd = new Dictionary<string, string>();
            //sd.Add( "appid", "YahooDemo" );
            //sd.Add( "&context", "Italian sculptors and painters of the renaissance favored the Virgin Mary for inspiration" );
            //sd.Add( "&query", "madonna" );

            string postUrl = "http://www.catlingraduates.com/wp-login.php";

            Dictionary<string, string> sd = new Dictionary<string, string>();
            sd.Add("log", "admincatlin");
            sd.Add("&pwd", "br5GEku7");
            sd.Add("&redirect_to", "http://www.catlingraduates.com/about-catlin/");

            var postResponse = new BasicHttpRequestResponse(postUrl);
            postResponse.PostParameters = sd;

            ViewData["PostUrl"] = postUrl;
            ViewData["PostResponse"] = postResponse.SendPostRequest();

            return View();
        }

     }
}
