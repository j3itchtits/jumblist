using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Website.Filter;
using Jumblist.Core.Service;
using xVal.ServerSide;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class PostsController : ViewModelController<Post>
    {
        private IPostService postService;

        public PostsController( IPostService postService )
        {
            this.postService = postService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = postService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Feeds";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Post() { } );
            model.PageTitle = "Create a new feed";
            model.NotificationMessage = new NotificationMessage { Text = "You are about to create a feed", StyleClass = "message" };

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = postService.Select( id );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Title );
            model.NotificationMessage = new NotificationMessage { Text = "You are about to edit something", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Save( Post item )
        {
            try
            {
                postService.Save( item );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            if (ModelState.IsValid)
            {
                NotificationMessage = new NotificationMessage { Text = item.Title + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( item );
                model.PageTitle = string.Format( "Edit - {0}", item.Title );
                model.NotificationMessage = new NotificationMessage { Text = "Something went wrong", StyleClass = "error" };
                return View( "edit", model );
            }
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var feed = postService.Select( id );
            postService.Delete( feed );

            var list = postService.SelectList();
            //var model = BuildDefaultViewModel().With( list );
            //model.Message = new Message { Text = feed.Title + " has been deleted", StyleClass = "message" };
            return PartialView( "ListPartial", list );


            //Message = new Message { Text = feed.Title + " has been deleted", StyleClass = "message" };
            //return RedirectToAction( "list", "feeds" ); 
        }
    }
}
