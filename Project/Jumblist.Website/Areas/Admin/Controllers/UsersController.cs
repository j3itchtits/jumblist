using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Website.Controllers;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using xVal.ServerSide;
using Jumblist.Website.Filter;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class UsersController : ViewModelController<User>
    {
        private IUserService userService;

        public UsersController( IUserService userService )
        {
            this.userService = userService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = userService.SelectRecordList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Users";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new User() );
            model.PageTitle = "Create";
            model.Message = new Message { Text = "You are about to create a user", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Create( User item, string confirmPassword )
        {
            try
            {
                userService.Create( item, confirmPassword );
                Message = new Message { Text = "User created", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDataEditDefaultViewModel().With( new User() );
            model.Message = new Message { Text = "Sorry, there was a problem. Please try again.", StyleClass = "error" };
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = userService.SelectRecord( id );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateInput( false )]
        public ActionResult Save( User item )
        {
            try
            {
                userService.Save( item, true );
                Message = new Message { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );
            model.Message = new Message { Text = "Sorry, there was a problem. Please try again.", StyleClass = "error" };
            return View( "edit", model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult ResetUserPassword( int userId, string password, string confirmPassword )
        {
            var user = userService.SelectRecord( userId );

            try
            {
                userService.ResetPassword( user, password, confirmPassword );
                Message = new Message { Text = user.Name + " has changed their password.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Reset" );
            }

            var model = BuildDataEditDefaultViewModel().With( user );
            model.PageTitle = string.Format( "Edit - {0}", user.Name );
            model.Message = new Message { Text = "Sorry, there was a problem. Please try again.", StyleClass = "error" };
            return View( "edit", model );
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var post = userService.SelectRecord( id );
            userService.Delete( post );
            TempData["notificationmessage"] = post.Name + " has been deleted";

            var model = userService.SelectRecordList();
            return PartialView( "UserList", model );
        }

    }
}
