using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service;
using MvcContrib;
using Jumblist.Website.ViewModel;
using Jumblist.Website.Filter;
using xVal.ServerSide;

namespace Jumblist.Website.Controller
{
    public class UsersController : ViewModelController<User>
    {
        private IUserService userService;

        public UsersController( IUserService userService )
        {
            this.userService = userService;
        }

        [LoadFeeds]
        public ViewResult List()
        {
            var list = userService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Users";

            return View( model );
        }

        public ViewResult Detail( int? id )
        {
            var item = userService.Select( (id ?? 1) );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Detail - {0}", item.Name );

            if (model == null)
                return View( "NotFound" );
            else
                return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new User() );
            model.PageTitle = "Create";

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int? id )
        {
            var item = userService.Select( (id ?? 1) );
            var model = BuildDataEditDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Edit - {0}", item.Name );

            if (model == null)
                return View( "NotFound" );
            else
                return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Save( User user )
        {
            if (ModelState.IsValid)
            {
                userService.Save( user );
                TempData["notificationmessage"] = user.Name + " has been saved.";
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( user );
                return View( "Edit", model );
            }
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var post = userService.Select( id );
            userService.Delete( post );
            TempData["notificationmessage"] = post.Name + " has been deleted";

            var model = userService.SelectList();
            return PartialView( "ListPartial", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Login()
        {
            var model = BuildDefaultViewModel();
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Login( string email, string password, string returnUrl )
        {
            if ( userService.Authenticate( email, password ) )
            {
                userService.SetAuthenticationCookie( email, true );

                if ( !string.IsNullOrEmpty( returnUrl ) )
                    return Redirect( returnUrl );
                else
                    return this.RedirectToAction<PagesController>( c => c.Index() );
            }
            else
            {
                var model = BuildDefaultViewModel();
                model.NotificationMessage = new NotificationMessage { Text = "Unknown email or password", StyleClass = "error" };

                return View( model );
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult Logout()
        {
            userService.RemoveAuthenticationCookie();
            return this.RedirectToAction<PagesController>( c => c.Index() );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Register()
        {
            var model = BuildDefaultViewModel();
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Register( string name, string email, string postcode, string password, string confirmPassword, string returnUrl )
        {
            // Attempt to register the user

            //name = Server.HtmlEncode( name );
            //email = Server.HtmlEncode( email );
            //password = Server.HtmlEncode( password );
            //confirmPassword = Server.HtmlEncode( confirmPassword );

            try
            {
                var user = userService.RegisterUser( name, email, postcode, password, confirmPassword );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "user" );
            }


            if (ModelState.IsValid)
            {
                userService.SetAuthenticationCookie( email, true );
                NotificationMessage = new NotificationMessage { Text = "Thank you for registering", StyleClass = "message" };

                if (!string.IsNullOrEmpty( returnUrl ))
                    return Redirect( returnUrl );
                else
                    return this.RedirectToAction<PagesController>( c => c.Index() );
            }
            else
            {
                var model = BuildDefaultViewModel();
                model.NotificationMessage = new NotificationMessage { Text = "Something went wrong", StyleClass = "error" };
                return View( model );
            }
        }
    }
}
