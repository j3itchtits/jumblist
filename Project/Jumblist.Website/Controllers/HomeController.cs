using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Website.BackgroundServices;

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

            return View();
        }

        public ActionResult HttpGet()
        {

            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            ViewData["Weather"] = HttpContext.Items["Temp"];

            //string url = "http://groups.yahoo.com/group/hastings-freecycle";
            //string url = "http://www.google.co.uk";
            //string url = "http://stuartclode.co.uk";
            //string url = "http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/tennis/rss.xml";



            //HTTP GET EXAMPLES 1

            //string getUrl1 = "http://www.catlingraduates.com/wp-login.php";
            //var getResponse1 = new HttpRequestResponse(getUrl1);

            //HTTP GET EXAMPLES 2

            string getUrl2 = "http://stuartclode.co.uk/wp-admin/edit.php";
            var getResponse2 = new BasicHttpRequestResponse(getUrl2);
            getResponse2.UserName = "sclode";
            getResponse2.Password = "Ed!nb8rgh";

            ViewData["GetUrl"] = getUrl2;
            ViewData["GetResponse"] = getResponse2.SendGetRequest();

            return View();
        }

        public ActionResult HttpPost()
        {

            //HTTP POST EXAMPLES

            //string postUrl = "http://api.search.yahoo.com/ContentAnalysisService/V1/termExtraction";

            //Dictionary<string, string> sd = new Dictionary<string, string>();
            //sd.Add( "appid", "YahooDemo" );
            //sd.Add( "&context", "Italian sculptors and painters of the renaissance favored the Virgin Mary for inspiration" );
            //sd.Add( "&query", "madonna" );

            string postUrl = "http://stuartclode.co.uk/wp-login.php";

            Dictionary<string, string> sd = new Dictionary<string, string>();
            sd.Add( "log", "sclode" );
            sd.Add( "&pwd", "Ed!nb8rgh" );
            sd.Add( "&redirect_to", "http://stuartclode.co.uk/" );

            var postResponse = new BasicHttpRequestResponse( postUrl );
            postResponse.PostParameters = sd;

            ViewData["PostUrl"] = postUrl;
            ViewData["PostResponse"] = postResponse.SendPostRequest();

            return View();
        }
     }
}
