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
using Jumblist.Website.ModelBinder;

namespace Jumblist.Website.Controllers
{
    public class HomeController : BaseController
    {
        private readonly ILocationService locationService;
        private readonly IUserService userService;

        public HomeController( ILocationService locationService, IUserService userService )
        {
            this.locationService = locationService;
            this.userService = userService;
        }

        public ViewResult Index( [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Home";
            model.User = user;
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult About( string formInput, string userId, string userEmail )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "About";
            ViewData["formInput"] = formInput;

            ViewData["userId"] = userId.DecryptString();
            ViewData["userEmail"] = userEmail.DecryptString();

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

        public ActionResult EmailTest()
        {
            User user = new User();
            user.UserId = 35;
            user.Email = "sclode@hodes.co.uk";

            MailService mailService = new MailService();
            mailService.SendRegistrationVerificationEmail( user );

            //userService.SendRegistrationVerificationEmail( user );

            var model = DefaultView.CreateModel();
            model.PageTitle = "email test";
            return View( model );
        }
    }
}
