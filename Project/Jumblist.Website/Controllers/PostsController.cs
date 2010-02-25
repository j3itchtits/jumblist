using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Routing;
using System.Configuration;
using Jumblist.Core.Model;
using Jumblist.Core.Service.Paging;
using Jumblist.Core.Service.Data;
using Jumblist.Website.ViewModel;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Extension;

namespace Jumblist.Website.Controllers
{
    public class PostsController : ViewModelController<Post>
    {
        private readonly IPostService postService;
        private readonly IDataService<Location> locationService;
        private readonly IDataService<Tag> tagService;
        private readonly IDataService<Feed> feedService;
        private readonly IDataService<PostCategory> postCategoryService;

        public PostsController( IPostService postService, IDataService<Location> locationService, IDataService<Tag> tagService, IDataService<Feed> feedService, IDataService<PostCategory> postCategoryService )
        {
            this.postService = postService;
            this.locationService = locationService;
            this.tagService = tagService;
            this.feedService = feedService;
            this.postCategoryService = postCategoryService;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Index( int? page )
        {
            var postList = postService.SelectList( true ).OrderByDescending(t => t.PublishDateTime);
            var pagedPostList = new PaginatedList<Post>( postList.ToList(), ( page ?? 1 ), frontEndPageSize );

            var model = BuildDefaultViewModel().With( pagedPostList );
            model.PageTitle = "All Posts";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Category( string id, int? page )
        {
            var postCategory = postCategoryService.Select( id );
            var postList = postService.SelectPostsByCategory( postCategory.PostCategoryId, true ).OrderByDescending( t => t.PublishDateTime );
            var pagedPostList = new PaginatedList<Post>( postList.ToList(), ( page ?? 1 ), frontEndPageSize );

            var model = BuildDefaultViewModel().With( pagedPostList );
            model.PageTitle = postCategory.Name + " Posts";

            return View( "index", model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult CategoryList( string highlightedCategory )
        {
            var postCategoryList = postCategoryService.SelectList();

            List<Link> model = new List<Link>();

            model.Add( new CategoryLink( null ) { IsSelected = ( string.IsNullOrEmpty( highlightedCategory ) ) } );
            foreach ( var category in postCategoryList )
            {
                model.Add( new CategoryLink( category.Name ) { IsSelected = ( highlightedCategory.Equals( category.Name, StringComparison.OrdinalIgnoreCase ) ) } );
            }

            return PartialView( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult BasicList( int top )
        {
            var model = postService.SelectList( true ).OrderByDescending( t => t.PublishDateTime ).Take( top );

            return PartialView("basiclist", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Detail(int id, string name)
        {
            var item = postService.Select( id );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = item.Title;

            return View( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Location(string id, int? page)
        {
            try
            {
                var location = locationService.SelectList().Single(x => x.FriendlyUrl == id);
                var postList = postService.SelectPostsByLocation(location.LocationId, true).OrderByDescending(t => t.PublishDateTime);
                var pagedPostList = new PaginatedList<Post>(postList.ToList(), (page ?? 1), frontEndPageSize);

                var model = BuildDefaultViewModel().With(pagedPostList);
                model.PageTitle = "All Posts by Location - " + location.Name;

                if (postList.Count() == 0) model.Message = new Message { Text = "No posts from this location - " + id, StyleClass = "message" };

                return View("index", model);
            }
            catch (Exception)
            {
                PageTitle = "Sorry we have a problem";
                Message = new Message { Text = "We could not find this location - " + id, StyleClass = "message" };
                return RedirectToAction("problem");
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Tagged(string id, int? page)
        {

            //we need to split the id string into a tag array using "+" as the separator

            

            try
            {
                var tag = tagService.SelectList().Single(x => x.FriendlyUrl == id);
                var postList = postService.SelectPostsByTag(tag.TagId, true).OrderByDescending(t => t.PublishDateTime);
                var pagedPostList = new PaginatedList<Post>(postList.ToList(), (page ?? 1), frontEndPageSize);

                var model = BuildDefaultViewModel().With(pagedPostList);
                model.PageTitle = "All Posts by Tag - " + tag.Name;

                if (postList.Count() == 0) model.Message = new Message { Text = "No posts tagged with " + id, StyleClass = "message" };

                return View("index", model);
            }
            catch (Exception)
            {
                PageTitle = "Sorry we have a problem";
                Message = new Message { Text = "We could not find this tag - " + id, StyleClass = "message" };
                return RedirectToAction("problem");
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Problem()
        {
            var model = BuildDefaultViewModel();
            return View(model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Group(string id, int? page)
        {
            try
            {
                var feed = feedService.SelectList().Single(x => x.FriendlyUrl == id);
                var postList = postService.SelectPostsByFeed(feed.FeedId, true).OrderByDescending(t => t.PublishDateTime);
                var pagedPostList = new PaginatedList<Post>(postList.ToList(), (page ?? 1), frontEndPageSize);

                var model = BuildDefaultViewModel().With(pagedPostList);
                model.PageTitle = "All Posts by Group - " + feed.Name;

                if (postList.Count() == 0) model.Message = new Message { Text = "No posts from this group - " + id, StyleClass = "message" };

                return View("index", model);
            }
            catch (Exception)
            {
                PageTitle = "Sorry we have a problem";
                Message = new Message { Text = "We could not find this group - " + id, StyleClass = "message" };
                return RedirectToAction("problem");
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(true)]
        public RedirectToRouteResult Search(string searchString, string searchOptions)
        {
            //Loads of logic to go here
            return RedirectToAction("tagged", new { id = searchString, page = string.Empty });
        }
    }

    public class CategoryLink : Link
    {
        public CategoryLink( string category )
        {
            if ( category != null )
            {
                Text = category;
                RouteValues = new RouteValueDictionary( new
                {
                    controller = "posts",
                    action = "category",
                    id = category.ToFriendlyUrl()
                } );
            }
            else
            {
                Text = "All";
                RouteValues = new RouteValueDictionary( new
                {
                    controller = "posts",
                    action = "index"
                } );
            }
        }
    }

    public class Link
    {
        public string Text { get; set; }
        public RouteValueDictionary RouteValues { get; set; }
        public bool IsSelected { get; set; }
    }
}
