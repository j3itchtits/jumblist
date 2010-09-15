using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Website.ViewModel;
using StuartClode.Mvc.Extension;
using System.Text.RegularExpressions;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using System.Configuration;

namespace Jumblist.Website.Controllers
{
    public class TestController : BaseController
    {
        private readonly IMailService mailService;
        private readonly IPostService postService;

        public TestController( IMailService mailService, IPostService postService )
        {
            this.mailService = mailService;
            this.postService = postService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Index( string formInput, string userId, string userEmail )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "About";
            ViewData["formInput"] = formInput;

            ViewData["userId"] = userId.DecryptString();
            ViewData["userEmail"] = userEmail.DecryptString();

            return View( model );
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

            foreach ( var result in results )
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

            foreach ( var match in tagMatches )
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
            string recipientEmail  = "sclode@hodes.co.uk";
            //string recipientEmail = "stuartclode@idnet.com";
            User user = new User();
            user.UserId = 35;
            user.Name = "Stuart";
            user.Email = recipientEmail;
            user.Postcode = "TN31 6HG";

            Post post = postService.SelectRecord( 5001 );

            UserAlert userAlert = new UserAlert();
            userAlert.Name = "My great alert";
            userAlert.User = user;

            IQueryable<Post> postList = postService.SelectRecordList( Post.WhereDisplayEquals( true ) ).OrderByDescending( t => t.PublishDateTime ).Take( 5 );

            //mailService.SendTestEmail( post, user );
            //mailService.SendTestEmail( user );
            //mailService.SendRegistrationVerificationEmail( user );
            mailService.SendPostEmail( post, user );
            //mailService.SendForgottenPasswordEmail( user );
            //mailService.SendPasswordResetEmail( user, "newpassword" );
            //mailService.SendEmailAlert( userAlert, postList );

            var model = DefaultView.CreateModel();
            model.PageTitle = "2 Test Emails Sent";
            model.Message = new Message() { Text = "The recipient email address was " + recipientEmail + " and the BCC was " + ConfigurationManager.AppSettings["AdminEmail"], StyleClass = "message" };
            return View( model );
        }
    }
}
