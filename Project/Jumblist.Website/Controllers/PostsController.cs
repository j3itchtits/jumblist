using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Routing;
using System.Configuration;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using Jumblist.Website.ViewModel;
using Jumblist.Website.Extension;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Model;
using System.Text.RegularExpressions;
using System.Collections;
using MvcMaps;
using StuartClode.Mvc.Service.Map;
using System.Web.Security;
using System.IO;
using System.Runtime.Serialization;
using System.Text;
using System.ServiceModel.Syndication;
using Jumblist.Website.Result;
using Jumblist.Website.ModelBinder;
using xVal.ServerSide;

namespace Jumblist.Website.Controllers
{
    public class PostsController : ViewModelController<Post>
    {
        private readonly int defaultPageSize = int.Parse( ConfigurationManager.AppSettings["DefaultPageSize"] );
        private readonly int defaultLocationRadius = int.Parse( ConfigurationManager.AppSettings["DefaultLocationRadius"] );
        private readonly string defaultUrl = ConfigurationManager.AppSettings["DefaultUrl"];

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
        public ActionResult Index( string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            try
            {
                string[] searchQuerystring = q.ToFriendlyQueryStringDecode();
                var postList = postService.SelectRecordList( searchQuerystring, user ).OrderByDescending( t => t.PublishDateTime );

                int currentPage = page.HasValue ? page.Value - 1 : 0;
                int currentPageSize = CalculatePageSize( pageSize, user.Session );
                string pageTitle = "All Posts";
                if (!string.IsNullOrEmpty(q)) pageTitle += " - with search term " + q;

                var pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
                var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExistFunc() ).Take( currentPageSize );

                var model = BuildPostViewModel();

                model.Q = q; 
                model.User = user;
                model.PostCategory = new PostCategory();
                model.Tags = new List<Tag>();
                model.Pushpins = pushpinList;
                model.PagedList = pagedPostList;
                model.PageTitle = pageTitle;
                model.ListCount = postList.Count();

                if ( model.ListCount == 0 )
                    model.Message = new Message { Text = "No posts with this search term - " + q, StyleClass = "message" };

                return View( model );
            }
            catch ( Exception ex )
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not generate the list and/or map view", StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult BasicList( int top )
        {
            var model = postService.SelectRecordList( Post.WhereDisplayEquals( true ) ).OrderByDescending( t => t.PublishDateTime ).Take( top );

            return PartialView( "BasicListControl", model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Category( string id, string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            try
            {
                string[] searchQuerystring = q.ToFriendlyQueryStringDecode();
                var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( id ) );
                var postList = postService.SelectRecordList( postCategory, searchQuerystring, user ).OrderByDescending( t => t.PublishDateTime ); ;

                int currentPage = page.HasValue ? page.Value - 1 : 0;
                int currentPageSize = CalculatePageSize( pageSize, user.Session );
                string pageTitle = postCategory.Name + " Posts";
                if ( !string.IsNullOrEmpty( q ) ) pageTitle += " - with search term " + q;

                var pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
                var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

                var model = BuildPostViewModel();

                model.Q = q;
                model.User = user;
                model.PostCategory = postCategory;
                model.Tags = new List<Tag>();
                model.Pushpins = pushpinList;
                model.PagedList = pagedPostList;
                model.PageTitle = pageTitle;
                model.ListCount = postList.Count();

                if ( model.ListCount == 0 )
                    model.Message = new Message { Text = "No posts categorised by " + id + " with this search term - " + q, StyleClass = "message" };

                return View("index", model);
            }
            catch ( Exception ex )
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this category - " + id + " with search term " + q, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Group( string id, string category, string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            try
            {
                string[] searchQuerystring = q.ToFriendlyQueryStringDecode();
                var group = feedService.SelectRecord( Feed.WhereFriendlyUrlEquals( id ) );
                var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
                var postList = postService.SelectRecordList( group, postCategory, searchQuerystring ).OrderByDescending( t => t.PublishDateTime ); ;

                int currentPage = page.HasValue ? page.Value - 1 : 0;
                int currentPageSize = CalculatePageSize( pageSize, user.Session );
                string pageTitle = "All " + category + " Posts by Group - " + group.Name;
                if ( !string.IsNullOrEmpty( q ) ) pageTitle += " - with search term " + q;

                var pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
                var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

                var model = BuildPostViewModel();

                model.Group = group;
                model.Q = q;
                model.PostCategory = postCategory ?? new PostCategory();
                model.Tags = new List<Tag>();
                model.Pushpins = pushpinList;
                model.PagedList = pagedPostList;
                model.PageTitle = pageTitle;
                model.ListCount = postList.Count();

                if ( model.ListCount == 0 )
                    model.Message = new Message { Text = "No posts from this group - " + id + " with search term " + q, StyleClass = "message" };

                return View("index", model);
            }
            catch ( Exception ex )
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this group - " + id, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Located( string id, string category, string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            try
            {
                string[] searchQuerystring = q.ToFriendlyQueryStringDecode();
                string[] locationsUrl = id.ToFriendlyUrlDecode();

                var locationList = locationService.SelectRecordList( Location.WhereFriendlyUrlListEqualsOr( locationsUrl ) );
                var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );

                var postList = postService.SelectRecordList( locationList, postCategory, searchQuerystring ).OrderByDescending( t => t.PublishDateTime ); ;

                int currentPage = page.HasValue ? page.Value - 1 : 0;
                int currentPageSize = CalculatePageSize( pageSize, user.Session );
                var pagedPostList = postList.ToPagedList( currentPage, currentPageSize );

                var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

                var model = BuildPostViewModel();

                model.Locations = locationList;
                model.Q = q;
                model.User = user;
                model.PostCategory = postCategory ?? new PostCategory();
                model.Tags = new List<Tag>();                
                model.Pushpins = pushpinList;
                model.PagedList = pagedPostList;
                model.PageTitle = "All " + category + " Posts by Location - " + locationList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2);
                model.ListCount = postList.Count();

                if ( model.ListCount == 0 )
                    model.Message = new Message { Text = "No posts from this location - " + id, StyleClass = "message" };

                return View("index", model);
            }
            catch (Exception ex)
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this location - " + id, StyleClass = "message" };
                return RedirectToAction("problem");
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Tagged( string id, string category, string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            try
            {
                string[] searchQuerystring = q.ToFriendlyQueryStringDecode();
                string[] tagsUrl = id.ToFriendlyUrlDecode();

                var tagList = tagService.SelectRecordList( Tag.WhereFriendlyUrlListEqualsOr( tagsUrl ) );
                var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
                var postList = postService.SelectRecordList( tagList, postCategory, searchQuerystring, user ).OrderByDescending( t => t.PublishDateTime ); ;

                int currentPage = page.HasValue ? page.Value - 1 : 0;
                int currentPageSize = CalculatePageSize( pageSize, user.Session );
                string pageTitle = "All " + category + " Posts by Tag - " + tagList.Select( x => x.Name ).ToFormattedStringList( "{0}, ", 2 );
                if ( !string.IsNullOrEmpty( q ) ) pageTitle += " - with search term " + q;

                var pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
                var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

                var model = BuildPostViewModel();

                model.Q = q;
                model.User = user;
                model.PostCategory = postCategory ?? new PostCategory();
                model.Tags = tagList; 
                model.Pushpins = pushpinList;
                model.PagedList = pagedPostList;
                model.PageTitle = pageTitle;
                model.ListCount = postList.Count();

                if ( model.ListCount == 0 )
                {
                    string contains = string.Empty;
                    if (!string.IsNullOrEmpty(q)) contains = " containing the search terms " + q;
                    model.Message = new Message { Text = "No posts tagged with " + tagList.Select( x => x.Name ).ToFormattedStringList("{0}, ", 2) + contains, StyleClass = "message" };
                }

                return View( "index", model );
            }
            catch ( Exception ex )
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this tag - " + id, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Detail( int id, string name )
        {
            var item = postService.SelectRecord( id );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = item.Title;

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateInput( true )]
        public RedirectToRouteResult Search( string postCategorySelection, string tagSearch, string locationSearch, int? locationRadius, string groupHidden, string locationHidden, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            if ( !string.IsNullOrEmpty( locationSearch ) )
            {
                locationSearch = locationSearch.ToCleanSearchString() + ", UK";
                int radius = (locationRadius.HasValue) ? (int)locationRadius : defaultLocationRadius;
                BingLocationService locationSearchCoordinates = new BingLocationService( locationSearch );

                user.Session.LocationName = locationSearch;
                user.Session.LocationRadius = radius;
                user.Session.LocationLatitude = locationSearchCoordinates.Latitude;
                user.Session.LocationLongitude = locationSearchCoordinates.Longitude;
            }
            else
            {
                user.Session = new UserSession( user.Session.PageSize );
            }

            userService.SaveSession( user.Session );

            searchService.TagSearch = tagSearch.ToCleanSearchString();
            searchService.PostCategorySelection = postCategorySelection ?? string.Empty;
            searchService.GroupHidden = groupHidden ?? string.Empty;
            searchService.LocationHidden = locationHidden ?? string.Empty;

            var searchResult = searchService.ProcessSearch();

            return RedirectToAction( searchResult.ActionName, searchResult.RouteValues );
        }


        [AcceptVerbs( HttpVerbs.Post )]
        public void Email( int id, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            postService.Email( id, user );
        }


        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult EmailAlert( string postcategory, string tags, string locations, string group, string q, string returnUrl, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            if ( user.IsAuthenticated )
            {
                return RedirectToAction( "EditEmailAlert", "Users", new { postcategory = postcategory, tags = tags, locations = locations, group = group, q = q, returnUrl = returnUrl } );
            }
            else
            {
                return RedirectToAction( "Login", "Users", new { returnUrl = returnUrl } );
            }
        }


        [AcceptVerbs( HttpVerbs.Get )]
        public RssResult Rss( string rssActionName, string rssActionId, string rssActionCategory, string q, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            SyndicationFeed feed =
                new SyndicationFeed( "Jumblist Feed",
                                    "This is a jumblist feed",
                                    new Uri( defaultUrl ),
                                    "TestFeedID",
                                    DateTime.Now );

            IEnumerable<Post> postList;

            switch ( rssActionName )
            {
                case "category":
                    postList = GetPostsByCategory( rssActionId, q, user );
                    break;
                case "group":
                    postList = GetPostsByGroup( rssActionId, rssActionCategory, q );
                    break;
                case "located":
                    postList = GetPostsByLocation( rssActionId, rssActionCategory );
                    break;
                case "tagged":
                    postList = GetPostsByTag( rssActionId, rssActionCategory, q, user );
                    break;
                default:
                    postList = GetPosts( q, user );
                    break;
            } 

            IEnumerable<SyndicationItem> items = postList.Select( x => (new SyndicationItem( x.Title, x.Body.ToShortDescription(), new Uri( defaultUrl + Url.PostUrl( x.PostId, x.Title ) ), x.PostId.ToString(), x.PublishDateTime )) );
          
            feed.Items = items;

            return Rss( feed );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult SelectCategory( RouteValueDictionary routeValueDic, string highlightedCategory )
        {
            var postCategoryList = postCategoryService.SelectRecordList(PostCategory.WhereIsNavigationEquals(true));

            List<Link> model = new List<Link>();

            model.Add(new CategoryLink(null, routeValueDic) { IsSelected = (string.IsNullOrEmpty(highlightedCategory)) });

            foreach (var category in postCategoryList)
            {
                model.Add(new CategoryLink(category.Name, routeValueDic) { IsSelected = (highlightedCategory.Equals(category.Name, StringComparison.OrdinalIgnoreCase)) });
            }

            return PartialView("SelectCategoryControl",model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Problem()
        {
            var model = BuildDefaultViewModel();
            return View(model);
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public string EditInPlace( string content )
        {
            if (!String.IsNullOrEmpty( content ))
            {
                return content;
            }
            else
            {
                return "arse";
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult MapTest()
        {
            return View();
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult TabTest()
        {
            return View();
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Add( string returnUrl, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            var model = BuildDataEditDefaultViewModel().With( new Post() { PublishDateTime = DateTime.Now, LastUpdatedDateTime = DateTime.Now } );
            model.ReturnUrl = returnUrl;
            model.PageTitle = "Create a new post";
            model.Message = new Message { Text = "You are about to create a post", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Add( Post item, string returnUrl, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            try
            {
                item.PublishDateTime = DateTime.Now;
                item.LastUpdatedDateTime = DateTime.Now;
                item.Display = true;
                item.Latitude = user.Latitude;
                item.Longitude = user.Longitude;
                item.UserId = user.UserId;

                postService.Save( item, true );

                Message = new Message { Text = item.Title + " has been saved.", StyleClass = "message" };
                return Redirect( returnUrl ?? "/" );
            }
            catch ( RulesException ex )
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Title );
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View( model );
        }

        private int CalculatePageSize( int? pageSize, UserSession userSession )
        {
            if ( pageSize.HasValue )
            {
                userSession.PageSize = pageSize;
                userService.SaveSession( userSession );
                return (int)pageSize;
            }
            else
            {
                return userSession.PageSize.HasValue ? userSession.PageSize.Value : defaultPageSize;
            }
        }

        private IEnumerable<Post> GetPosts( string q, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            return postService.SelectRecordList( q.ToFriendlyQueryStringDecode(), user ).OrderByDescending( t => t.PublishDateTime );
        }

        private IEnumerable<Post> GetPostsByTag( string tags, string category, string q, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            var tagList = tagService.SelectRecordList( Tag.WhereFriendlyUrlListEqualsOr( tags.ToFriendlyUrlDecode() ) );
            var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
            return postService.SelectRecordList( tagList, postCategory, q.ToFriendlyQueryStringDecode(), user ).OrderByDescending( t => t.PublishDateTime ); ;
        }

        private IEnumerable<Post> GetPostsByLocation( string locations, string category )
        {
            var locationList = locationService.SelectRecordList( Location.WhereFriendlyUrlListEqualsOr( locations.ToFriendlyUrlDecode() ) );
            var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
            return postService.SelectRecordList( locationList, postCategory ).OrderByDescending( t => t.PublishDateTime ); ;
        }

        private IEnumerable<Post> GetPostsByGroup( string feed, string category, string q )
        {
            var group = feedService.SelectRecord( Feed.WhereFriendlyUrlEquals( feed ) );
            var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
            return postService.SelectRecordList( group, postCategory, q.ToFriendlyQueryStringDecode() ).OrderByDescending( t => t.PublishDateTime ); ;
        }

        private IEnumerable<Post> GetPostsByCategory( string category, string q, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
            return postService.SelectRecordList( postCategory, q.ToFriendlyQueryStringDecode(), user ).OrderByDescending( t => t.PublishDateTime ); ;
        }

        //[AcceptVerbs( HttpVerbs.Get )]
        //public ActionResult SearchResult( string q, string category, User user, int? page, int? pageSize )
        //{
        //    try
        //    {
        //        var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals(category) );
        //        var postList = postService.SelectRecordList( postCategory, q, user );

        //        int currentPage = page.HasValue ? page.Value - 1 : 0;
        //        int currentPageSize = CalculatePageSize( pageSize, user.Session );
        //        var pagedPostList = postList.ToPagedList( currentPage, currentPageSize );

        //        var pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

        //        var model = BuildPostViewModel();

        //        model.User = user;
        //        model.PostCategory = postCategory;
        //        model.Pushpins = pushpinList;
        //        model.PagedList = pagedPostList;
        //        model.PageTitle = "All " + category + " Posts with the following search terms - " + q;
        //        model.ListCount = postList.Count();

        //        if (postList.Count() == 0)
        //            model.Message = new Message { Text = "No posts with the following search terms " + q, StyleClass = "message" };

        //        return View( "index", model );
        //    }
        //    catch ( Exception ex )
        //    {
        //        PageTitle = "Sorry we have a problem" + ex.Message;
        //        Message = new Message { Text = "We could not find this search term " + q, StyleClass = "message" };
        //        return RedirectToAction( "problem" );
        //    }
        //}

        //[AcceptVerbs(HttpVerbs.Post)]
        //[ValidateInput(true)]
        //public RedirectToRouteResult Search( string postCategorySearch, string tagSearch, string locationSearch, int? locationRadius, string groupSearch )
        //{
        //    if (!string.IsNullOrEmpty( locationSearch ))
        //    {
        //        locationSearch = locationSearch.ToCleanSearchString() + ", UK";

        //        //user.Search.LocationName = locationSearch;
        //        //user.Search.LocationRadius = locationRadius;

        //        BingLocationService locationSearchCoordinates = new BingLocationService( locationSearch );
        //        //user.Search.LocationLatitude = locationSearchCoordinates.Latitude;
        //        //user.Search.LocationLongitude = locationSearchCoordinates.Longitude;

        //        //At this point we need a method on IUserService that allows us to SET the user details to either a anon session or auth cookie
        //        //Perhaps we need 2 methods - one for anon and one for auth

        //        SearchUser searchUser = new SearchUser( locationSearch, locationRadius, locationSearchCoordinates.Latitude, locationSearchCoordinates.Longitude );

        //        (HttpContext.Session[userKey] as User).Search = searchUser;

        //        //HttpCookie testCookie = HttpContext.Request.Cookies["test"];
        //        //testCookie.Value = "You've just run a search";
        //        //testCookie.Expires = testCookie.Expires.AddDays( 1 );
        //        //HttpContext.Response.Cookies.Add( testCookie );
        //    }




        //    searchService.TagSearch = tagSearch.ToCleanSearchString();
        //    //searchService.LocationSearch = locationSearch;
        //    searchService.PostCategorySearch = postCategorySearch;

        //    if (groupSearch == null) groupSearch = string.Empty;
        //    searchService.GroupSearch = groupSearch;




        //    //searchService.Tags = tagService.SelectTagNameList();
        //    //searchService.Locations = locationService.SelectLocationNameTownList();

        //    var searchResult = searchService.ProcessSearch();

        //    return RedirectToAction( searchResult.ActionName, searchResult.RouteValues );

        //    //searchString = searchString.ToCleanSearchString();

        //    //var searchPattern = searchString.ToSearchRegexPattern();
        //    //var tagsInput = string.Join( "\n", tagService.SelectTagNameList() );
        //    //var locationsInput = string.Join( "\n", locationService.SelectLocationNameTownList() );

        //    //var tagMatches = Regex.Matches( tagsInput, searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );
        //    //var locationMatches = Regex.Matches( locationsInput, searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );

        //    //var tagMatchesCompareString = ((IEnumerable)tagMatches).ToFormattedStringList( "{0} " );
        //    //var locationMatchesCompareString = ((IEnumerable)locationMatches).ToFormattedStringList( "{0} " );
        //    //var compareString = (tagMatchesCompareString + locationMatchesCompareString).Trim();

        //    //bool isCompleteSearchMatch = string.Compare(searchString.ToAlphabetical(), compareString.ToAlphabetical(), true) == 0;

        //    //if (tagMatches.Count > 0 && locationMatches.Count == 0 && isCompleteSearchMatch)
        //    //{
        //    //    //string tagQueryString = ((IEnumerable)tagMatches).ToFormattedStringList( "{0}, ", 2 ).FriendlyUrlEncode();
        //    //    return RedirectToAction( "tagged", new { id = tagQueryString, category = searchOptions, page = string.Empty } );
        //    //}

        //    //if (tagMatches.Count == 0 && locationMatches.Count > 0 && isCompleteSearchMatch)
        //    //{
        //    //    //string locationQueryString = ((IEnumerable)locationMatches).ToFormattedStringList( "{0}, ", 2 ).FriendlyUrlEncode();
        //    //    return RedirectToAction( "located", new { id = locationQueryString, category = searchOptions, page = string.Empty } );
        //    //}

        //    //if (tagMatches.Count > 0 && locationMatches.Count > 0 && isCompleteSearchMatch)
        //    //{
        //    //    //string tagQueryString = ((IEnumerable)tagMatches).ToFormattedStringList( "{0}, ", 2 ).FriendlyUrlEncode();
        //    //    //string locationQueryString = ((IEnumerable)locationMatches).ToFormattedStringList( "{0}, ", 2 ).FriendlyUrlEncode();
        //    //    return RedirectToAction( "search", new { tagged = tagQueryString, located = locationQueryString, category = searchOptions, page = string.Empty } );
        //    //}

        //    //PageTitle = "Sorry we have a problem";
        //    //return RedirectToAction("problem");

        //}

    }
}
