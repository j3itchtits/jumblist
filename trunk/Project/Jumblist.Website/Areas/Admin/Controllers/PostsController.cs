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
using StuartClode.Mvc.Service.Map;
using System.Configuration;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class PostsController : ViewModelController<Post>
    {
        private readonly int defaultPageSize = int.Parse( ConfigurationManager.AppSettings["DefaultPageSize"] );
        private IPostService postService;
        private IDataService<PostCategory> postCategoryService;
        private IDataService<Feed> feedService;
        private IDataService<User> userService;
        private IDataService<PostLocation> postLocationService;
        private IDataService<PostTag> postTagService;
        private ILocationService locationService;
        private ITagService tagService;
        private IDataService<FeedLocation> feedLocationService;

        public PostsController(
            IPostService postService, 
            IDataService<PostCategory> postCategoryService, 
            IDataService<Feed> feedService, 
            IDataService<User> userService,
            IDataService<PostLocation> postLocationService,
            IDataService<PostTag> postTagService,
            ILocationService locationService,
            ITagService tagService,
            IDataService<FeedLocation> feedLocationService
            )
        {
            this.postService = postService;
            this.postCategoryService = postCategoryService;
            this.feedService = feedService;
            this.userService = userService;
            this.postLocationService = postLocationService;
            this.postTagService = postTagService;
            this.locationService = locationService;
            this.tagService = tagService;
            this.feedLocationService = feedLocationService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List( int? page )
        {
            var postList = postService.SelectRecordList().OrderByDescending( t => t.PublishDateTime );

            int currentPage = page.HasValue ? page.Value - 1 : 0;
            var pagedPostList = postList.ToPagedList( currentPage, defaultPageSize );

            var model = BuildDefaultViewModel().With( pagedPostList );
            model.PageTitle = "All Posts";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Post() { PublishDateTime = DateTime.Now, LastUpdatedDateTime = DateTime.Now } );
            model.PageTitle = "Create a new post";
            model.Message = new Message { Text = "You are about to create a post", StyleClass = "message" };

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = postService.SelectRecord( id );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Title );
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateInput( false )]
        public ActionResult Save( Post item )
        {
            try
            {
                postService.Save( item, true );
                Message = new Message { Text = item.Title + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Title );
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View( "edit", model );
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var item = postService.SelectRecord( id );
            postService.Delete( item );

            var model = postService.SelectRecordList().OrderByDescending( t => t.PublishDateTime );

            return PartialView( "PostList", model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryList()
        {
            var list = postCategoryService.SelectRecordList();

            var model = DefaultView.CreateModel<PostCategory>().With(list);
            model.PageTitle = "Post Categories";

            return View("CategoryList", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryEdit(int id)
        {
            var item = postCategoryService.SelectRecord(id);

            var model = DefaultView.CreateModel<PostCategory>().With(item);
            model.PageTitle = string.Format("Edit - {0}", item.Name);
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View(model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryCreate()
        {
            var model = DefaultView.CreateModel<PostCategory>().With(new PostCategory());
            model.PageTitle = "Create a new category";
            model.Message = new Message { Text = "You are about to create a category", StyleClass = "message" };

            return View("CategoryEdit", model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CategorySave( PostCategory item )
        {
            try
            {
                postCategoryService.Save( item, true );
                Message = new Message { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "categorylist" );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors(ModelState, "Item");
            }

            var model = DefaultView.CreateModel<PostCategory>().With(item);
            model.PageTitle = string.Format("Edit - {0}", item.Name);
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View("categoryedit", model);
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult ListByCategory( int id )
        {
            var postCategory = postCategoryService.SelectRecord( id );
            var postList = postService.SelectRecordList( Post.WherePostCategoryEquals( postCategory ) ).OrderByDescending( t => t.PublishDateTime );


            var model = BuildDefaultViewModel().With( postList );
            model.PageTitle = "All Posts by Category - " + postCategory.Name;

            return View( "list", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult ListByFeed( int id )
        {
            var feed = feedService.SelectRecord( id );
            var postList = postService.SelectRecordList( Post.WhereFeedEquals( feed ) ).OrderByDescending( t => t.PublishDateTime );

            var model = BuildDefaultViewModel().With( postList );
            model.PageTitle = "All Posts by Feed - " + feed.Name;

            return View( "list", model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult ListByUser( int id )
        {
            var user = userService.SelectRecord( id );
            var postList = postService.SelectRecordList( Post.WhereUserEquals( user ) ).OrderByDescending( t => t.PublishDateTime );

            var model = BuildDefaultViewModel().With( postList );
            model.PageTitle = "All Posts by User - " + user.Name;

            return View( "list", model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult ListByLocation( string id )
        {
            int number;
            bool isInt = Int32.TryParse( id, out number );

            var location = isInt ? locationService.SelectRecord( number ) : locationService.SelectRecord( Location.WhereFriendlyUrlEquals( id ) );
            var postList = postService.SelectRecordList(PostLocation.WhereLocationEquals(location)).OrderByDescending(t => t.PublishDateTime);

            var model = BuildDefaultViewModel().With( postList );
            model.PageTitle = "All Posts by Location - " + location.Name;

            return View("list", model);
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult ListByTag( string id )
        {
            int number;
            bool isInt = Int32.TryParse( id, out number );

            var tag = isInt ? tagService.SelectRecord( number ) : tagService.SelectRecord( Tag.WhereNameEquals( id ) );
            var postList = postService.SelectRecordList(PostTag.WhereTagEquals(tag)).OrderByDescending(t => t.PublishDateTime);

            var model = BuildDefaultViewModel().With( postList );
            model.PageTitle = "All Posts by Tag - " + tag.Name;

            return View( "list", model );
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult PostLocationCreate( int postId, string locationNameAndArea )
        {
            var post = postService.SelectRecord( postId );

            //if the location is a postcode then we don't have a locationArea
            var locationArray = locationNameAndArea.Split( new string[] { StringExtensions.FieldSeparator }, StringSplitOptions.RemoveEmptyEntries );
            var locationName = locationArray[0];
            var locationArea = (locationArray.Count() > 1) ? locationArray[1] : string.Empty;

            Location location;

            if (string.IsNullOrEmpty(locationArea))
                location = locationService.SelectRecord(Location.WhereEquals(locationName));
            else
                location = locationService.SelectRecord( Location.WhereEquals( locationName, locationArea ) );

            try
            {
                var existingPostLocations = postLocationService.IsDuplicate( PostLocation.WhereEquals( postId, location.LocationId ) );

                if (!existingPostLocations)
                {
                    var postLocation = new PostLocation { PostId = postId, LocationId = location.LocationId };
                    postLocationService.Save( postLocation );
                }

                var existingFeedLocations = feedLocationService.IsDuplicate( FeedLocation.WhereEquals( post.FeedId, location.LocationId ) );

                if (!existingFeedLocations)
                {
                    var feedLocation = new FeedLocation { FeedId = (int)post.FeedId, LocationId = location.LocationId };
                    feedLocationService.Save( feedLocation );
                }

                post.Latitude = location.Latitude;
                post.Longitude = location.Longitude;
            }
            catch( Exception )
            {

            }

            postService.Save( post );

            var model = postLocationService.SelectRecordList( PostLocation.WherePostEquals( post ) );

            return PartialView( "PostLocationList", model );
        }

        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult PostLocationDelete( int postId, int postLocationId )
        {
            var postLocation = postLocationService.SelectRecord( postLocationId );
            postLocationService.Delete( postLocation );

            var model = postLocationService.SelectRecordList( PostLocation.WherePostIdEquals( postId ) );

            return PartialView( "PostLocationList", model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult PostTagCreate( int postId, string tagName )
        {
            var tag = tagService.SelectRecord( tagName );

            if (tag != null)
            {
                var existingPostTags = postTagService.IsDuplicate( PostTag.WhereEquals( postId, tag.TagId ) );

                if ( !existingPostTags )
                {
                    var postTag = new PostTag { PostId = postId, TagId = tag.TagId };
                    postTagService.Save( postTag );
                }
            }
            else
            {
                var newTag = new Tag { Name = tagName, FriendlyUrl = tagName.ToFriendlyUrlEncode() };
                tagService.Save( newTag );

                var postTag = new PostTag { PostId = postId, TagId = newTag.TagId };
                postTagService.Save( postTag );
            }

            var model = postTagService.SelectRecordList( PostTag.WherePostIdEquals( postId ) );

            return PartialView( "PostTagList", model );
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult PostTagDelete( int postId, int postTagId )
        {
            var item = postTagService.SelectRecord( postTagId );
            postTagService.Delete( item );

            var model = postTagService.SelectRecordList( PostTag.WherePostIdEquals( postId ) );

            return PartialView( "PostTagList", model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult LocationCreate( int postId, string locationName, string locationArea )
        {
            var post = postService.SelectRecord( postId );

            var location = new Location { Name = locationName, FriendlyUrl = ( locationName + ", " + locationArea ).ToFriendlyUrlEncode(), Area = locationArea };
            locationService.Save( location );

            var postLocation = new PostLocation { PostId = postId, LocationId = location.LocationId };
            postLocationService.Save( postLocation );

            var feedLocation = new FeedLocation { FeedId = (int)post.FeedId, LocationId = location.LocationId };
            feedLocationService.Save( feedLocation );

            post.Latitude = location.Latitude;
            post.Longitude = location.Longitude;

            postService.Save( post );

            var model = postLocationService.SelectRecordList( PostLocation.WherePostEquals( post ) );

            return PartialView( "PostLocationList", model );
        }
    }
}
