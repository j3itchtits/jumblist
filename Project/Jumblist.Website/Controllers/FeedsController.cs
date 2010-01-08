using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service;
using xVal.ServerSide;
using StuartClode.Mvc.Extension;
using Jumblist.Website.Filter;

namespace Jumblist.Website.Controller
{
    public class FeedsController : ViewModelController<Feed>
    {
        private IFeedService feedService;

        public FeedsController( IFeedService feedService )
        {
            this.feedService = feedService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        //[CustomAuthorization( RoleLevel = RoleLevels.Administrator )]
        public ViewResult List()
        {
            var list = feedService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Feeds";

            var notification = new Notification();
            notification.RegisterMessage( "This is a message", "message" );
            notification.RegisterMessage( "This is another message", "message" );

            model.Notification = notification;

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Detail( int? id )
        {
            var item = feedService.Select( (id ?? 1) );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Detail - {0}", item.Title );
            model.NotificationMessage = new NotificationMessage { Text = "This is a message", StyleClass = "message" };

            if (model == null)
                return View( "NotFound" );
            else
                return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Feed() { LastUpdateDateTime = DateTime.Now } );
            model.PageTitle = "Create a new feed";
            model.NotificationMessage = new NotificationMessage { Text = "You are about to create a feed", StyleClass = "message" };

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int? id )
        {
            var item = feedService.Select( (id ?? 1) );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Title );
            model.NotificationMessage = new NotificationMessage { Text = "You are about to edit something", StyleClass = "message" };

            if (model == null)
                return View( "NotFound" );
            else
                return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Save( Feed item )
        {
            try
            {
                feedService.Save( item );
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
            var feed = feedService.Select( id );
            feedService.Delete( feed );

            var list = feedService.SelectList();
            //var model = BuildDefaultViewModel().With( list );
            //model.Message = new Message { Text = feed.Title + " has been deleted", StyleClass = "message" };
            return PartialView( "ListPartial", list );


            //Message = new Message { Text = feed.Title + " has been deleted", StyleClass = "message" };
            //return RedirectToAction( "list", "feeds" ); 
        }
    }
}
