using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Website.Controllers;
using Jumblist.Core.Model;
using Jumblist.Core.Service.Data;
using xVal.ServerSide;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    public class UsersController : ViewModelController<User>
    {
        private IUserService userService;

        public UsersController( IUserService userService )
        {
            this.userService = userService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = userService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Users";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
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
                Message = new Message { Text = "User created", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( new User() );
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                return View( model );
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = userService.Select( id );

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
                userService.SaveUser( item );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            if (ModelState.IsValid)
            {
                Message = new Message { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( item );
                model.PageTitle = string.Format( "Edit - {0}", item.Name );
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
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
                Message = new Message { Text = user.Name + " has changed their password.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( user );
                model.PageTitle = string.Format( "Edit - {0}", user.Name );
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
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
            return PartialView( "UserList", model );
        }

    }
}
