using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Text.RegularExpressions;
using StuartClode.Mvc.Extension;
using Jumblist.Core.Service.Data;

namespace Jumblist.Website.Controllers
{
    public class HomeController : RootControllerBase
    {
        private readonly ILocationService locationService;

        public HomeController(ILocationService locationService)
        {
            this.locationService = locationService;
        }

        public ViewResult Index()
        {
            return View();
        }

        public ViewResult About()
        {
            return View();
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
            var searchStringRegexPattern = searchString.ToSearchRegexPattern();

            var tagMatches = Regex.Matches( input, searchStringRegexPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );

            string matchString = string.Empty;

            foreach (var match in tagMatches)
            {
                matchString += match.ToString() + "<br/>";
            }

            return output + "Regex input : " + input + "<br/>Regex pattern : " + searchStringRegexPattern + "<br/><br/>Matches: <br/>" + matchString;



        }
    }
}
