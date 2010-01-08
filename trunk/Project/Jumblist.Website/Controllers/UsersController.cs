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
            //var model = BuildDefaultViewModel();
            var model = BuildDataEditDefaultViewModel().With( new User() );
            model.PageTitle = "Create";

            return View( "Create", model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Create( User user, string confirmPassword )
        {
            try
            {
                userService.CreateUser( user.Name, user.Email, user.Password, confirmPassword, user.RoleId );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "User" );
            }

            if (ModelState.IsValid)
            {
                NotificationMessage = new NotificationMessage { Text = "User created", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( new User() );
                model.NotificationMessage = new NotificationMessage { Text = "Something went wrong", StyleClass = "error" };
                return View( model );
            }
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
        public ActionResult Save( User item )
        {
            try
            {
                userService.SaveUser( item );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            if (ModelState.IsValid)
            {
                NotificationMessage = new NotificationMessage { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( item );
                model.PageTitle = string.Format( "Edit - {0}", item.Name );
                model.NotificationMessage = new NotificationMessage { Text = "Something went wrong", StyleClass = "error" };
                return View( "edit", model );

            }
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult ResetUserPassword( int userId, string password, string confirmPassword )
        {
            var user = userService.Select( userId );

            try
            {
                userService.ResetUserPassword( user, password, confirmPassword );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Reset" );
            }

            if (ModelState.IsValid)
            {
                NotificationMessage = new NotificationMessage { Text = user.Name + " has changed their password.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( user );
                model.PageTitle = string.Format( "Edit - {0}", user.Name );
                model.NotificationMessage = new NotificationMessage { Text = "Something went wrong", StyleClass = "error" };
                return View( "edit", model );
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
        public ActionResult Login( string name, string password, string returnUrl )
        {
            if ( userService.Authenticate( name, password ) )
            {
                userService.SetAuthenticationCookie( name, true );

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
