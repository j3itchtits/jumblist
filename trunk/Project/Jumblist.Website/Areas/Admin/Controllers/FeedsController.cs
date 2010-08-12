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
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Extension;
using Jumblist.Website.ViewModel;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class FeedsController : ViewModelController<Feed>
    {
        private IFeedService feedService;
        private IDataService<FeedCategory> feedCategoryService;
        private IDataService<FeedLocation> feedLocationService;
        private ILocationService locationService;

        public FeedsController(IFeedService feedService, IDataService<FeedCategory> feedCategoryService, IDataService<FeedLocation> feedLocationService, ILocationService locationService)
        {
            this.feedService = feedService;
            this.feedCategoryService = feedCategoryService;
            this.feedLocationService = feedLocationService;
            this.locationService = locationService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = feedService.SelectRecordList().OrderBy( x => x.Name );

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Feeds";

            var messages = new List<Message>();
            messages.Add( new Message { Text = "New: This is the first message", StyleClass = "message" } );
            messages.Add( new Message { Text = "New: This is the second message", StyleClass = "message" } );
            model.MessageList = messages;

            model.Message = new Message { Text = "This is just one message", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult ListByLocation(string id)
        {
            int number;
            bool isInt = Int32.TryParse(id, out number);

            var location = isInt ? locationService.SelectRecord(number) : locationService.SelectRecord(Location.WhereFriendlyUrlEquals(id));
            var feedList = location.Feeds.OrderBy( t => t.Name );

            var model = BuildDefaultViewModel().With(feedList);
            model.PageTitle = "All Feeds by Location - " + location.Name;

            return View("list", model);
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Feed() { LastUpdateDateTime = DateTime.Now } );
            model.PageTitle = "Create a new feed";
            model.Message = new Message { Text = "You are about to create a feed", StyleClass = "message" };

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = feedService.SelectRecord( id );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateInput( false )]
        public ActionResult Save( Feed item )
        {
            try
            {
                feedService.Save( item, true );
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

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var feed = feedService.SelectRecord( id );
            feedService.Delete( feed );

            var list = feedService.SelectRecordList();

            return PartialView( "FeedList", list );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryList()
        {
            var list = feedCategoryService.SelectRecordList();

            var model = DefaultView.CreateModel<FeedCategory>().With(list);
            model.PageTitle = "Feed Categories";

            return View("CategoryList", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryEdit(int id)
        {
            var item = feedCategoryService.SelectRecord(id);

            var model = DefaultView.CreateModel<FeedCategory>().With(item);
            model.PageTitle = string.Format("Edit - {0}", item.Name);
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View(model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryCreate()
        {
            var model = DefaultView.CreateModel<FeedCategory>().With(new FeedCategory());
            model.PageTitle = "Create a new category";
            model.Message = new Message { Text = "You are about to create a category", StyleClass = "message" };

            return View("CategoryEdit", model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CategorySave( FeedCategory item )
        {
            try
            {
                feedCategoryService.Save( item, true );
                Message = new Message { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "categorylist" );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors(ModelState, "Item");
            }

            var model = DefaultView.CreateModel<FeedCategory>().With(item);
            model.PageTitle = string.Format("Edit - {0}", item.Name);
            model.Message = new Message { Text = "Sorry, there was a problem. Please try again.", StyleClass = "error" };
            return View("categoryedit", model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult FeedLocationCreate( int feedId, string locationName, string locationArea )
        {
            var locationItem = locationService.SelectRecord( Location.WhereEquals( locationName, locationArea ) );

            if (locationItem != null)
            {
                var existingFeedLocations = feedLocationService.IsDuplicate( FeedLocation.WhereEquals( feedId, locationItem.LocationId ) );

                if ( !existingFeedLocations )
                {
                    var feedLocationItem = new FeedLocation { FeedId = feedId, LocationId = locationItem.LocationId };
                    feedLocationService.Save( feedLocationItem );
                }
            }
            else
            {
                var newLocationItem = new Location { Name = locationName, FriendlyUrl = (locationName + ", " + locationArea).ToFriendlyUrlEncode(), Area = locationArea };
                locationService.Save( newLocationItem );

                var feedLocationItem = new FeedLocation { FeedId = feedId, LocationId = newLocationItem.LocationId };
                feedLocationService.Save( feedLocationItem );
            }

            var model = feedLocationService.SelectRecordList( FeedLocation.WhereFeedIdEquals( feedId ) );

            return PartialView( "FeedLocationList", model );
        }

        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult FeedLocationDelete(int feedId, int feedLocationId)
        {
            var item = feedLocationService.SelectRecord( feedLocationId );
            feedLocationService.Delete( item );

            var model = feedLocationService.SelectRecordList( FeedLocation.WhereFeedIdEquals( feedId ) );

            return PartialView("FeedLocationList", model);
        }
    }
}
