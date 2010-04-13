using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Routing;
using System.Configuration;
using Jumblist.Core.Model;
using Jumblist.Core.Service.Data;
using Jumblist.Website.ViewModel;
using Jumblist.Website.Extension;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Model;
using System.Text.RegularExpressions;
using System.Collections;
using Jumblist.Core.Service;
using MvcMaps;

namespace Jumblist.Website.Controllers
{
    public class PostsController : ViewModelController<Post>
    {
        private readonly IPostService postService;
        private readonly ILocationService locationService;
        private readonly ITagService tagService;
        private readonly IDataService<Feed> feedService;
        private readonly IDataService<PostCategory> postCategoryService;
        private readonly ISearchService searchService;
        private readonly IUserService userService;

        public PostsController( IPostService postService, ILocationService locationService, ITagService tagService, IDataService<Feed> feedService, IDataService<PostCategory> postCategoryService, ISearchService searchService, IUserService userService )
        {
            this.postService = postService;
            this.locationService = locationService;
            this.tagService = tagService;
            this.feedService = feedService;
            this.postCategoryService = postCategoryService;
            this.searchService = searchService;
            this.userService = userService;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Index( int? page )
        {
            var postList = postService.SelectRecordList( Post.WhereDisplayEquals( true ) ).OrderByDescending( t => t.PublishDateTime );
            var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() );
            var pagedPostList = postList.ToPagedList( page, frontEndPageSize );

            var model = PostView.Model();

            model.PostCategory = string.Empty;
            model.Pushpins = pushpinList;
            model.PaginatedList = pagedPostList;
            model.PageTitle = "All Posts";
            model.ListCount = postList.Count();

            return View( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult CategoryList( RouteValueDictionary routeValueDic, string highlightedCategory )
        {
            var postCategoryList = postCategoryService.SelectRecordList( PostCategory.WhereIsNavigationEquals( true ) );

            List<Link> model = new List<Link>();

            model.Add( new CategoryLink( null, routeValueDic ) { IsSelected = (string.IsNullOrEmpty( highlightedCategory )) } );

            foreach ( var category in postCategoryList )
            {
                model.Add( new CategoryLink( category.Name, routeValueDic ) { IsSelected = (highlightedCategory.Equals( category.Name, StringComparison.OrdinalIgnoreCase )) } );
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
        public ActionResult Category( string id, string q, int? page )
        {
            try
            {
                var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals(id) );
                var postList = postService.SelectRecordList( postCategory, q );
                var pushpinList = postList.ToFilteredPushPinList(Post.WhereLatLongValuesExist());
                var pagedPostList = postList.ToPagedList( page, frontEndPageSize );

                var model = PostView.Model();

                model.PostCategory = postCategory.Name;
                model.Pushpins = pushpinList;
                model.PaginatedList = pagedPostList;
                model.PageTitle = postCategory.Name + " Posts";
                model.ListCount = postList.Count();

                return View("index", model);
            }
            catch ( Exception ex )
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this category - " + id, StyleClass = "message" };
                return RedirectToAction("problem");
            }

            
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Group( string id, string category, string q, int? page )
        {
            try
            {
                var feed = feedService.SelectRecord( Feed.WhereFriendlyUrlEquals( id ) );
                var postCategory = (category.Length > 0) ? postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) ) : null;
                var postList = postService.SelectRecordList( feed, postCategory, q );
                var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() );
                var pagedPostList = postList.ToPagedList( page, frontEndPageSize );

                var model = PostView.Model();

                model.PostCategory = (postCategory != null) ? postCategory.Name : string.Empty;
                model.Pushpins = pushpinList;
                model.PaginatedList = pagedPostList;
                model.PageTitle = "All " + category + " Posts by Group - " + feed.Name;
                model.ListCount = postList.Count();

                if (postList.Count() == 0)
                    model.Message = new Message { Text = "No posts from this group - " + id, StyleClass = "message" };

                return View("index", model);
            }
            catch ( Exception ex )
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this group - " + id, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        //[AcceptVerbs(HttpVerbs.Get)]
        //public ActionResult Located( string id, string category, string q, int? page )
        //{
        //    try
        //    {
        //        var locationList = locationService.SelectRecordList(Location.WhereFriendlyUrlListEqualsOr(id.ToFriendlyUrlDecode()));
        //        var postCategory = (category.Length > 0) ? postCategoryService.SelectRecord(PostCategory.WhereNameEquals(category)) : null;
        //        var postList = postService.SelectRecordList( locationList, postCategory, q );
        //        var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() );
        //        var pagedPostList = postList.ToPagedList( page, frontEndPageSize );

        //        var model = PostView.Model();

        //        model.PostCategory = (postCategory != null) ? postCategory.Name : string.Empty;
        //        model.Pushpins = pushpinList;
        //        model.PaginatedList = pagedPostList;
        //        model.PageTitle = "All " + category + " Posts by Location - " + locationList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2);
        //        model.ListCount = postList.Count();

        //        if (postList.Count() == 0) 
        //            model.Message = new Message { Text = "No posts from this location - " + id, StyleClass = "message" };

        //        return View("index", model);
        //    }
        //    catch ( Exception ex )
        //    {
        //        PageTitle = "Sorry we have a problem" + ex.Message;
        //        Message = new Message { Text = "We could not find this location - " + id, StyleClass = "message" };
        //        return RedirectToAction( "problem" );
        //    }
        //}

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Tagged( string id, string category, string q, int? page )
        {
            try
            {
                var tagList = tagService.SelectRecordList( Tag.WhereFriendlyUrlListEqualsOr( id.ToFriendlyUrlDecode() ) );
                var postCategory = (category.Length > 0) ? postCategoryService.SelectRecord(PostCategory.WhereNameEquals(category)) : null;
                var postList = postService.SelectRecordList( tagList, postCategory, q );
                var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() );
                var pagedPostList = postList.ToPagedList( page, frontEndPageSize );

                var model = PostView.Model();

                model.User = null;
                model.PostCategory = (postCategory != null) ? postCategory.Name : string.Empty;
                model.Pushpins = pushpinList;
                model.PaginatedList = pagedPostList;
                model.PageTitle = "All " + category + " Posts by Tag - " + tagList.Select( x => x.Name ).ToFormattedStringList( "{0}, ", 2 );
                model.ListCount = postList.Count();

                if (postList.Count() == 0)
                    model.Message = new Message { Text = "No posts tagged with " + tagList.Select( x => x.Name ).ToFormattedStringList( "{0}, ", 2 ), StyleClass = "message" };

                return View("index", model);
            }
            catch ( Exception ex )
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this tag - " + id, StyleClass = "message" };
                return RedirectToAction("problem");
            }
        }

        //[AcceptVerbs(HttpVerbs.Get)]
        //public ActionResult TaggedLocations( string tagged, string located, string category, string q, int? page )
        //{
        //    try
        //    {
        //        var tagList = tagService.SelectRecordList( Tag.WhereFriendlyUrlListEqualsOr( tagged.ToFriendlyUrlDecode() ) );
        //        var locationList = locationService.SelectRecordList( Location.WhereFriendlyUrlListEqualsOr(located.ToFriendlyUrlDecode()) );
        //        var postCategory = (category.Length > 0) ? postCategoryService.SelectRecord(PostCategory.WhereNameEquals(category)) : null;
        //        var postList = postService.SelectRecordList( tagList, locationList, postCategory, q );
        //        var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() );
        //        var pagedPostList = postList.ToPagedList( page, frontEndPageSize );

        //        var model = PostView.Model();

        //        model.PostCategory = (postCategory != null) ? postCategory.Name : string.Empty;
        //        model.Pushpins = pushpinList;
        //        model.PaginatedList = pagedPostList;
        //        model.PageTitle = "All " + category + " Posts by Tag - " + tagList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2);
        //        model.PageTitle += "All " + category + " Posts by Location - " + locationList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2);
        //        model.ListCount = postList.Count();

        //        if (postList.Count() == 0)
        //        {
        //            model.Message = new Message { Text = "No posts tagged with " + tagList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2), StyleClass = "message" };
        //            model.Message = new Message { Text = "No posts located at " + locationList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2), StyleClass = "message" };
        //        }

        //        return View( "index", model );
        //    }
        //    catch ( Exception ex )
        //    {
        //        PageTitle = "Sorry we have a problem" + ex.Message;
        //        Message = new Message { Text = "We could not find this tag - " + tagged + " or location - " + located, StyleClass = "message" };
        //        return RedirectToAction( "problem" );
        //    }
        //}

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Search( User user, string q, string category, int? page )
        {

            try
            {
                //put the following line in rootcontrollerbase class - maybe - note check out the model binder thing so that the user can be passed via the method parameters - either as a Session (like the Basket) or perhaps the authCookie (then we wouldn't need the AuthenticateRequest method in global.asax or any of that stypid serialization crap
                //var user = (HttpContext.User.Identity.IsAuthenticated) ? userService.SelectRecord(HttpContext.User.Identity.Name) : Jumblist.Core.Model.User.Anonymous;
                
                var postCategory = (category.Length > 0) ? postCategoryService.SelectRecord(PostCategory.WhereNameEquals(category)) : null;
                var postList = postService.SelectRecordList( postCategory, q );
                var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() );
                var pagedPostList = postList.ToPagedList( page, frontEndPageSize );

                var model = PostView.Model();

                model.User = user;
                model.PostCategory = (postCategory != null) ? postCategory.Name : string.Empty;
                model.Pushpins = pushpinList;
                model.PaginatedList = pagedPostList;
                model.PageTitle = "All " + category + " Posts with the following search terms - " + q;
                model.ListCount = postList.Count();

                if (postList.Count() == 0)
                    model.Message = new Message { Text = "No posts with the following search terms " + q, StyleClass = "message" };


                return View( "index", model );
            }
            catch ( Exception ex )
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this search term " + q, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(true)]
        public RedirectToRouteResult Search(string tagSearch, string locationSearch, string postCategorySearch)
        {
            searchService.TagSearch = tagSearch.ToCleanSearchString();
            searchService.LocationSearch = locationSearch.ToCleanSearchString();
            searchService.PostCategorySearch = postCategorySearch;



            //searchService.Tags = tagService.SelectTagNameList();
            //searchService.Locations = locationService.SelectLocationNameTownList();

            var searchResult = searchService.ProcessSearch();

            return RedirectToAction( searchResult.ActionName, searchResult.RouteValues );

            //searchString = searchString.ToCleanSearchString();

            //var searchPattern = searchString.ToSearchRegexPattern();
            //var tagsInput = string.Join( "\n", tagService.SelectTagNameList() );
            //var locationsInput = string.Join( "\n", locationService.SelectLocationNameTownList() );

            //var tagMatches = Regex.Matches( tagsInput, searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );
            //var locationMatches = Regex.Matches( locationsInput, searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );

            //var tagMatchesCompareString = ((IEnumerable)tagMatches).ToFormattedStringList( "{0} " );
            //var locationMatchesCompareString = ((IEnumerable)locationMatches).ToFormattedStringList( "{0} " );
            //var compareString = (tagMatchesCompareString + locationMatchesCompareString).Trim();

            //bool isCompleteSearchMatch = string.Compare(searchString.ToAlphabetical(), compareString.ToAlphabetical(), true) == 0;

            //if (tagMatches.Count > 0 && locationMatches.Count == 0 && isCompleteSearchMatch)
            //{
            //    //string tagQueryString = ((IEnumerable)tagMatches).ToFormattedStringList( "{0}, ", 2 ).FriendlyUrlEncode();
            //    return RedirectToAction( "tagged", new { id = tagQueryString, category = searchOptions, page = string.Empty } );
            //}

            //if (tagMatches.Count == 0 && locationMatches.Count > 0 && isCompleteSearchMatch)
            //{
            //    //string locationQueryString = ((IEnumerable)locationMatches).ToFormattedStringList( "{0}, ", 2 ).FriendlyUrlEncode();
            //    return RedirectToAction( "located", new { id = locationQueryString, category = searchOptions, page = string.Empty } );
            //}

            //if (tagMatches.Count > 0 && locationMatches.Count > 0 && isCompleteSearchMatch)
            //{
            //    //string tagQueryString = ((IEnumerable)tagMatches).ToFormattedStringList( "{0}, ", 2 ).FriendlyUrlEncode();
            //    //string locationQueryString = ((IEnumerable)locationMatches).ToFormattedStringList( "{0}, ", 2 ).FriendlyUrlEncode();
            //    return RedirectToAction( "search", new { tagged = tagQueryString, located = locationQueryString, category = searchOptions, page = string.Empty } );
            //}

            //PageTitle = "Sorry we have a problem";
            //return RedirectToAction("problem");
            
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Problem()
        {
            var model = BuildDefaultViewModel();
            return View(model);
        }
    }
}
