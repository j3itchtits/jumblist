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
using Jumblist.Website.Filter;

namespace Jumblist.Website.Controllers
{
    public class HomeController : BaseController
    {
        private readonly ILocationService locationService;
        private readonly IUserService userService;
        private readonly IMailService mailService;

        public HomeController( ILocationService locationService, IUserService userService, IMailService mailService )
        {
            this.locationService = locationService;
            this.userService = userService;
            this.mailService = mailService;
        }

        //[OutputCache( CacheProfile = "Dashboard" )]
        [AcceptVerbs( HttpVerbs.Get | HttpVerbs.Head )]
        public ViewResult Index( [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Home";
            model.User = user;
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult About()
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "About";


            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Privacy()
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Privacy Policy";
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Terms()
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Terms and Conditions";
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Faq()
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Frequently asked questions";
            return View( model );
        }


    }
}
