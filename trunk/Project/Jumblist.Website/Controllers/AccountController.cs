using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Security;
using Jumblist.Website.Services.Authentication;

namespace Jumblist.Website.Controllers
{
    public class AccountController : Controller
    {

        // This constructor is used by the MVC framework to instantiate the controller using
        // the default forms authentication and membership providers.

        public AccountController()
            : this( null )
        {
        }

        // This constructor is not used by the MVC framework but is instead provided for ease
        // of unit testing this type. See the comments at the end of this file for more
        // information.
        public AccountController( IFormsAuthentication formsAuth )
        {
            FormsAuth = formsAuth ?? new FormsAuthenticationService();
        }

        public IFormsAuthentication FormsAuth
        {
            get; private set;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Login()
        {
            return View();
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Login( string username, string password, bool rememberMe, string returnUrl )
        {
            if (!ValidateLogOn( username, password ))
            {
                return View();
            }

            FormsAuth.SignIn( username, rememberMe );

            if (!String.IsNullOrEmpty( returnUrl ))
            {
                return Redirect( returnUrl );
            }
            else
            {
                return RedirectToAction( "index", "pages" );
            }
        }

        public RedirectToRouteResult LogOut()
        {
            FormsAuth.SignOut();

            return RedirectToAction( "index", "pages" );
        }



        #region Validation Methods

        private bool ValidateLogOn( string username, string password )
        {
            if (String.IsNullOrEmpty( username ))
            {
                ModelState.AddModelError( "username", "You must specify a username." );
            }
            if (String.IsNullOrEmpty( password ))
            {
                ModelState.AddModelError( "password", "You must specify a password." );
            }
            if (!FormsAuth.Authenticate( username, password ))
            {
                ModelState.AddModelError( "_FORM", "The username or password provided is incorrect." );
            }

            return ModelState.IsValid;
        }

        #endregion
    }
}
