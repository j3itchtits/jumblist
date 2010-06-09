using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Core.Service;
using xVal.ServerSide;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Extension;
using Jumblist.Website.ViewModel;
using Jumblist.Website.Filter;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class LocationsController : ViewModelController<Location>
    {
        private ILocationService locationService;
        private IFeedService feedService;

        public LocationsController(ILocationService locationService, IFeedService feedService)
        {
            this.locationService = locationService;
            this.feedService = feedService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = locationService.SelectRecordList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Locations";

            return View( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult ListByFeed(int id)
        {
            var feed = feedService.SelectRecord(id);
            var locationList = feed.Locations.OrderBy(l => l.Name);
            //var locationList = locationService.SelectRecordList(FeedLocation.WhereFeedEquals(feed)).OrderBy(t => t.Name);

            var model = BuildDefaultViewModel().With(locationList);
            model.PageTitle = "All Locations by Feed - " + feed.Name;

            return View("list", model);
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Location() );
            model.PageTitle = "Create a new location";
            model.Message = new Message { Text = "You are about to create a location", StyleClass = "message" };

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = locationService.SelectRecord( id );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateInput( false )]
        public ActionResult Save( Location item )
        {
            try
            {
                locationService.Save( item, true );
                Message = new Message { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View( "edit", model );
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var feed = locationService.SelectRecord( id );
            locationService.Delete( feed );

            var list = locationService.SelectRecordList();

            return PartialView( "LocationList", list );
        }



    }
}