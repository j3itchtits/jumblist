using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Text.RegularExpressions;
using StuartClode.Mvc.Extension;
using Jumblist.Core.Service;
using Jumblist.Website.ViewModel;
using Jumblist.Core.Model;

namespace Jumblist.Website.Controllers
{
    public class HomeController : BaseController
    {
        private readonly ILocationService locationService;

        public HomeController(ILocationService locationService)
        {
            this.locationService = locationService;
        }

        public ViewResult Index( User user )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Home";
            model.User = user;
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult About( string formInput )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "About";
            ViewData["formInput"] = formInput;
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public RedirectToRouteResult SubmitAbout( string formInput )
        {
            return RedirectToAction( "about", new { formInput = formInput } );
        }

        public string Help()
        {

            //var locationsInput = string.Join("<br/>", locationService.SelectLocationNameTownList());

            //return locationsInput;

            var table = new[] 
            {
                new { uid = 1 },
                new { uid = 2 },
                new { uid = 3 },
                new { uid = 4 },
                new { uid = 5 }
            };

            var search = new[] { "1", "5", "10" };

            //var results = from x in table
            //              where search.Contains( x.uid.ToString() )
            //              select x;

            var results = table.Where( x => search.Contains( x.uid.ToString() ) );

            string output = string.Empty;

            foreach (var result in results)
            {
                output += "Result: " + result.uid.ToString() + ", ";
            }
            output += "<br/><br/>";


            var input = "baby\nclothes\nhat\ngirl\nbed\nbaby girl";

            var searchString = "baby girl hastings";
            //var searchString = "";
            var searchStringRegexPattern = searchString.ToSearchRegexPattern();

            var tagMatches = Regex.Matches( input, searchStringRegexPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );
            var tagm = Regex.Matches( "hello", "", RegexOptions.ExplicitCapture );

            string matchString = string.Empty;

            foreach (var match in tagMatches)
            {
                matchString += match.ToString() + "<br/>";
            }

            return output + "Regex input : " + input + "<br/>Regex pattern : " + searchStringRegexPattern + "<br/><br/>Matches: <br/>" + matchString;
        }

        public ActionResult jQueryTest()
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "jQuery";
            return View( model );
        }

        public ActionResult AnotherJQueryTest()
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "jQuery";
            return View( model );
        }
    }
}
