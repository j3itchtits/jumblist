using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Core.Service.Data;
using StuartClode.Mvc.Service;
using MvcContrib;
using Jumblist.Website.ViewModel;
using Jumblist.Website.Filter;
using xVal.ServerSide;

namespace Jumblist.Website.Controllers
{
    public class UsersController : ViewModelController<User>
    {
        private IUserService userService;

        public UsersController( IUserService userService )
        {
            this.userService = userService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Detail( int id )
        {
            var item = userService.Select( id );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Detail - {0}", item.Name );

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult LoginLinks( bool isAuthenticated, string name )
        {
            if ( !isAuthenticated )
            {
                return View( "LoginLinksUnauthenticated" );
            }
            else
            {
                var item = userService.GetUser( name );
                var model = BuildDefaultViewModel().With( item );
                return View( "LoginLinksAuthenticated", model );
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Login()
        {
            var model = BuildDefaultViewModel();
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Login( string name, string password, string returnUrl )
        {
            if ( userService.Authenticate( name, password ) )
            {
                userService.SetAuthenticationCookie( name, true );

                if ( !string.IsNullOrEmpty( returnUrl ) )
                    return Redirect( returnUrl );
                else
                    return this.RedirectToAction<HomeController>( c => c.Index() );
            }
            else
            {
                var model = BuildDefaultViewModel();
                model.Message = new Message { Text = "Unknown username or password", StyleClass = "error" };

                return View( model );
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult Logout()
        {
            userService.RemoveAuthenticationCookie();
            return this.RedirectToAction<HomeController>( c => c.Index() );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Register()
        {
            var model = BuildDefaultViewModel();
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Register( User user, string confirmPassword, string returnUrl )
        {
            try
            {
                userService.RegisterUser( user.Name, user.Email, user.Postcode, user.Password, confirmPassword );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "User" );
            }

            if (ModelState.IsValid)
            {
                userService.SetAuthenticationCookie( user.Name, true );
                Message = new Message { Text = "Thank you for registering", StyleClass = "message" };

                if (!string.IsNullOrEmpty( returnUrl ))
                    return Redirect( returnUrl );
                else
                    return this.RedirectToAction<HomeController>( c => c.Index() );
            }
            else
            {
                var model = BuildDefaultViewModel();
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                return View( model );
            }
        }
    }
}
