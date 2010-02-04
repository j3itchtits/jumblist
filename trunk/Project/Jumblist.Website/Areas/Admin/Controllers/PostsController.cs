using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Website.Filter;
using Jumblist.Core.Service.Data;
using xVal.ServerSide;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Extension;
using Jumblist.Website.ViewModel;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class PostsController : ViewModelController<Post>
    {
        private IPostService postService;
        private IDataService<PostCategory> postCategoryService;
        private IDataService<Feed> feedService;
        private IDataService<User> userService;
        private IDataService<PostLocation> postLocationService;
        private IDataService<PostTag> postTagService;
        private IDataService<Location> locationService;
        private IDataService<Tag> tagService;

        public PostsController(
            IPostService postService, 
            IDataService<PostCategory> postCategoryService, 
            IDataService<Feed> feedService, 
            IDataService<User> userService,
            IDataService<PostLocation> postLocationService,
            IDataService<PostTag> postTagService,
            IDataService<Location> locationService,
            IDataService<Tag> tagService
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
            model.PageTitle = "All Posts";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Post() { DateTime = DateTime.Now } );
            model.PageTitle = "Create a new post";
            model.Message = new Message { Text = "You are about to create a post", StyleClass = "message" };

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = postService.Select( id );

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
                postService.Save( item );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            if (ModelState.IsValid)
            {
                Message = new Message { Text = item.Title + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( item );
                model.PageTitle = string.Format( "Edit - {0}", item.Title );
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                return View( "edit", model );
            }
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var item = postService.Select( id );
            postService.Delete( item );

            var model = postService.SelectList();

            return PartialView("PostList", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryList()
        {
            var list = postCategoryService.SelectList();

            var model = DefaultView.Model<PostCategory>().With(list);
            model.PageTitle = "Post Categories";

            return View("CategoryList", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryEdit(int id)
        {
            var item = postCategoryService.Select(id);

            var model = DefaultView.Model<PostCategory>().With(item);
            model.PageTitle = string.Format("Edit - {0}", item.Name);
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View(model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryCreate()
        {
            var model = DefaultView.Model<PostCategory>().With(new PostCategory());
            model.PageTitle = "Create a new category";
            model.Message = new Message { Text = "You are about to create a category", StyleClass = "message" };

            return View("CategoryEdit", model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CategorySave(PostCategory item)
        {
            try
            {
                postCategoryService.Save(item);
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors(ModelState, "Item");
            }

            if (ModelState.IsValid)
            {
                Message = new Message { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction("categorylist");
            }
            else
            {
                var model = DefaultView.Model<PostCategory>().With(item);
                model.PageTitle = string.Format("Edit - {0}", item.Name);
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                return View("categoryedit", model);
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult ListByCategory( int id )
        {
            var item = postCategoryService.Select( id );
            var list = postService.SelectList().Where( x => x.PostCategoryId == id );

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Posts by Category - " + item.Name;

            return View( "list", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult ListByFeed( int id )
        {
            var item = feedService.Select( id );
            var list = postService.SelectList().Where( x => x.FeedId == id );

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Posts by Feed - " + item.Name;

            return View( "list", model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult ListByUser(int id)
        {
            var item = userService.Select(id);
            var list = postService.SelectList().Where(x => x.UserId == id);

            var model = BuildDefaultViewModel().With(list);
            model.PageTitle = "All Posts by User - " + item.Name;

            return View("list", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Location( string id )
        {
            int number;
            Location item;
            IEnumerable<Post> list;

            bool result = Int32.TryParse( id, out number );
            
            if (result)
            {
                item = locationService.Select( number );
                list = postService.SelectPostsByLocation( number );
            }
            else
            {
                item = locationService.SelectList().Single( x => x.FriendlyUrl == id );
                list = postService.SelectPostsByLocation( id );
            }

            var model = BuildDefaultViewModel().With(list);
            model.PageTitle = "All Posts by Location - " + item.Name;

            return View("list", model);
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Tagged( string id )
        {
            int number;
            Tag item;
            IEnumerable<Post> list;

            bool result = Int32.TryParse( id, out number );

            if (result)
            {
                item = tagService.Select( number );
                list = postService.SelectPostsByTag( number );
            }
            else
            {
                item = tagService.SelectList().Single( x => x.FriendlyUrl == id );
                list = postService.SelectPostsByTag( id );
            }

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Posts by Tag - " + item.Name;

            return View( "list", model );
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult PostLocationCreate( int postId, string location )
        {
            var locationItem = locationService.Select( location );

            if (locationItem != null)
            {
                var postLocationItem = new PostLocation { PostId = postId, LocationId = locationItem.LocationId };
                postLocationService.Save(postLocationItem);
            }
            else
            {
                var newLocationItem = new Location { Name = location, LocationCategoryId = 3 };
                locationService.Save(newLocationItem);

                var postLocationItem = new PostLocation { PostId = postId, LocationId = newLocationItem.LocationId };
                postLocationService.Save(postLocationItem);
            }

            var model = postLocationService.SelectList().Where( x => x.PostId == postId );
            
            //ModelState["location"].Value = new ValueProviderResult(null, string.Empty,null);
            //ModelState.Clear();

            return PartialView( "PostLocationList", model );
        }

        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult PostLocationDelete( int postId, int postLocationId )
        {
            var item = postLocationService.Select( postLocationId );
            postLocationService.Delete( item );

            var model = postLocationService.SelectList().Where( x => x.PostId == postId );

            return PartialView( "PostLocationList", model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult PostTagCreate( int postId, string tag )
        {
            var tagItem = tagService.Select( tag );

            if (tagItem != null)
            {
                var postTagItem = new PostTag { PostId = postId, TagId = tagItem.TagId };
                postTagService.Save(postTagItem);
            }
            else
            {
                var newTagItem = new Tag { Name = tag };
                tagService.Save(newTagItem);

                var postTagItem = new PostTag { PostId = postId, TagId = newTagItem.TagId };
                postTagService.Save(postTagItem);
            }

            var model = postTagService.SelectList().Where( x => x.PostId == postId );

            return PartialView( "PostTagList", model );
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult PostTagDelete( int postId, int postTagId )
        {
            var item = postTagService.Select( postTagId );
            postTagService.Delete( item );

            var model = postTagService.SelectList().Where( x => x.PostId == postId );

            return PartialView( "PostTagList", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult FindLocations( string q )
        {
            var locations = locationService.SelectList()
                .Where( r => r.Name.StartsWith( q ) )
                .Select( r => r.Name )
                .ToArray();

            //return raw text, one result on each line
            return Content( string.Join( "\n", locations ) );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult FindTags( string q )
        {
            var tags = tagService.SelectList()
                .Where( r => r.Name.StartsWith( q ) )
                .Select( r => r.Name )
                .ToArray();

            //return raw text, one result on each line
            return Content( string.Join( "\n", tags ) );
        } 
    }
}
