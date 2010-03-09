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
using System.Text.RegularExpressions;

namespace Jumblist.Website.Controllers
{
    public class PostsController : ViewModelController<Post>
    {
        private readonly IPostService postService;
        private readonly ILocationService locationService;
        private readonly ITagService tagService;
        private readonly IDataService<Feed> feedService;
        private readonly IDataService<PostCategory> postCategoryService;

        public PostsController(IPostService postService, ILocationService locationService, ITagService tagService, IDataService<Feed> feedService, IDataService<PostCategory> postCategoryService)
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
            var postList = postService.SelectRecordList( Post.WhereDisplayEquals( true ) ).OrderByDescending( t => t.PublishDateTime );
            var pagedPostList = new PaginatedList<Post>( postList.ToList(), ( page ?? 1 ), frontEndPageSize );

            var model = BuildDefaultViewModel().With( pagedPostList );
            model.PageTitle = "All Posts";
            model.ListCount = postList.Count();

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Category( string id, int? page )
        {
            var postCategory = postCategoryService.SelectRecord( x => x.Name == id );
            var postList = postService.SelectRecordList( Post.WherePostCategoryEquals(postCategory).And(Post.WhereDisplayEquals(true)) ).OrderByDescending( t => t.PublishDateTime );
            var pagedPostList = new PaginatedList<Post>( postList.ToList(), ( page ?? 1 ), frontEndPageSize );

            var model = BuildDefaultViewModel().With( pagedPostList );
            model.PageTitle = postCategory.Name + " Posts";
            model.ListCount = postList.Count();

            return View( "index", model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult CategoryList( string highlightedCategory )
        {
            var postCategoryList = postCategoryService.SelectRecordList();

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
            var model = postService.SelectRecordList( Post.WhereDisplayEquals( true ) ).OrderByDescending( t => t.PublishDateTime ).Take( top );

            return PartialView("basiclist", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Detail(int id, string name)
        {
            var item = postService.SelectRecord( id );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = item.Title;

            return View( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Located( string id, int? page )
        {
            try
            {
                var location = locationService.SelectRecord( Location.WhereFriendlyUrlEquals( id ) );

                var postList = postService.SelectListByLocation( Post.WhereDisplayEquals( true ), PostLocation.WhereLocationEquals( location ) ).OrderByDescending( t => t.PublishDateTime );

                var pagedPostList = new PaginatedList<Post>( postList.ToList(), (page ?? 1), frontEndPageSize );

                var model = BuildDefaultViewModel().With(pagedPostList);
                model.PageTitle = "All Posts by Location - " + location.Name;
                model.ListCount = postList.Count();

                if (postList.Count() == 0) 
                    model.Message = new Message { Text = "No posts from this location - " + id, StyleClass = "message" };

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
        public ActionResult Tagged( string id, string category, int? page )
        {
            try
            {
                string[] tags = id.Split('+');
                var tagList = tagService.SelectRecordList( Tag.WhereFriendlyUrlListEqualsOr( tags ) );

                IEnumerable<Post> postList;

                if (!string.IsNullOrEmpty(category))
                {
                    var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
                    //Or
                    //postList = postService.SelectListByTag( Post.WherePostCategoryEquals( postCategory ).And( Post.WhereDisplayEquals( true ) ), PostTag.WhereNameListEqualsOr( tagList ) ).OrderByDescending( t => t.PublishDateTime ).Distinct();
                    //And
                    postList = postService.SelectListByTag( Post.WherePostCategoryEquals( postCategory ).And( Post.WhereDisplayEquals( true ) ), tagList ).OrderByDescending( t => t.PublishDateTime );
                }
                else
                {
                    //Or
                    //postList = postService.SelectListByTag( Post.WhereDisplayEquals( true ), PostTag.WhereNameListEqualsOr( tagList ) ).OrderByDescending( t => t.PublishDateTime ).Distinct();
                    //And
                    postList = postService.SelectListByTag( Post.WhereDisplayEquals( true ), tagList ).OrderByDescending( t => t.PublishDateTime );

                }
                
                var pagedPostList = new PaginatedList<Post>(postList.ToList(), (page ?? 1), frontEndPageSize);

                var model = BuildDefaultViewModel().With(pagedPostList);
                model.PageTitle = "All " + category + " Posts by Tag - " + tagList.Select( x => x.Name ).ToArray().ToFormattedList( "{0}, " );
                model.ListCount = postList.Count();

                if (postList.Count() == 0) 
                    model.Message = new Message { Text = "No posts tagged with " + tagList.Select( x => x.Name ).ToArray().ToFormattedList( "{0}, " ), StyleClass = "message" };

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
                var feed = feedService.SelectRecord( Feed.WhereFriendlyUrlEquals( id ) );

                var postList = postService.SelectRecordList( Post.WhereFeedEquals(feed).And(Post.WhereDisplayEquals(true)) ).OrderByDescending(t => t.PublishDateTime);
                var pagedPostList = new PaginatedList<Post>(postList.ToList(), (page ?? 1), frontEndPageSize);

                var model = BuildDefaultViewModel().With(pagedPostList);
                model.PageTitle = "All Posts by Group - " + feed.Name;
                model.ListCount = postList.Count();

                if (postList.Count() == 0) 
                    model.Message = new Message { Text = "No posts from this group - " + id, StyleClass = "message" };

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
            var searchPattern = searchString.ToSearchRegexPattern();

            var tagsInput = string.Join("\n", tagService.SelectTagNameList());
            var locationsInput = string.Join("\n", locationService.SelectLocationNameTownList());

            var tagMatches = Regex.Matches(tagsInput, searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline);
            var locationMatches = Regex.Matches(locationsInput, searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline);

            if (tagMatches.Count > 0 && locationMatches.Count == 0)
            {
                string queryString = GenerateQueryString(tagMatches);
                return RedirectToAction("tagged", new { id = queryString, category = searchOptions, page = string.Empty });
            }

            if (tagMatches.Count == 0 && locationMatches.Count > 0)
            {
                string queryString = GenerateQueryString(locationMatches);
                return RedirectToAction("located", new { id = queryString, category = searchOptions, page = string.Empty });
            }

            if (tagMatches.Count > 0 && locationMatches.Count > 0)
            {
                string tagQueryString = GenerateQueryString(tagMatches);
                string locationQueryString = GenerateQueryString(locationMatches);
                return RedirectToAction("search", new { tagged = tagQueryString, located = locationQueryString, category = searchOptions, page = string.Empty });
            }

            PageTitle = "Sorry we have a problem";
            return RedirectToAction("problem");
            
        }


        private string GenerateQueryString(MatchCollection matches)
        {
            string queryString = string.Empty;

            foreach (var match in matches)
            {
                queryString += match.ToString().ToFriendlyUrl() + "+";
            }

            return queryString.Remove(queryString.Length - 1);
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
