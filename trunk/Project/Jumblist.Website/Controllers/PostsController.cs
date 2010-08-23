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
using StuartClode.Mvc.Service.Serialization;
using Jumblist.Website.Filter;

namespace Jumblist.Website.Controllers
{
    [CompressResponse]
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
        private readonly IMailService mailService;
        private readonly IDataService<UserAlert> userAlertService;

        public PostsController( IPostService postService, ILocationService locationService, ITagService tagService, IDataService<Feed> feedService, IDataService<PostCategory> postCategoryService, ISearchService searchService, IUserService userService, IMailService mailService, IDataService<UserAlert> userAlertService )
        {
            this.postService = postService;
            this.locationService = locationService;
            this.tagService = tagService;
            this.feedService = feedService;
            this.postCategoryService = postCategoryService;
            this.searchService = searchService;
            this.userService = userService;
            this.mailService = mailService;
            this.userAlertService = userAlertService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        //[ResetAuthUserSearchDetails]
        public ActionResult Index( string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            UserSearchArea userSearchArea = jumblistSession.UserSearchArea;
            ResetAuthUserSearchDetails( ref userSearchArea, user );

            int currentPage = page.HasValue ? page.Value - 1 : 0;
            int currentPageSize = CalculatePageSize( pageSize, jumblistSession.PageSize );

            string pageTitle = "All Posts";
            if ( !string.IsNullOrEmpty( q ) ) pageTitle += " filtered by search term '" + q + "'";

            IEnumerable<Post> postList = postService.SelectRecordList( q.ToFriendlyQueryStringDecode(), jumblistSession.UserSearchArea ).OrderByDescending( t => t.PublishDateTime );
            IPagedList<Post> pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
            IEnumerable<Pushpin> pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExistFunc() ).Take( currentPageSize );

            PostViewModel model = BuildPostViewModel();

            model.Q = q; 
            model.User = user;
            model.UserSearchArea = jumblistSession.UserSearchArea;
            model.PostCategory = new PostCategory();
            model.WithSelectList( typeof( PostCategory ), PostCategorySearchSelectList() );
            model.Tags = new List<Tag>();
            model.Pushpins = pushpinList;
            model.PagedList = pagedPostList;
            model.PageTitle = pageTitle;
            model.ListCount = postList.Count();

            if ( model.ListCount == 0 )
            {
                model.Message = new Message { Text = "Sorry, there are no posts with this search term - " + q + ".", StyleClass = "message" };
            }

            jumblistSession.PostListRouteValues.Update( "Index", q );
            jumblistSession.PageSize = currentPageSize;

            return View( model );

        }

        [AcceptVerbs( HttpVerbs.Get )]
        [OutputCache( CacheProfile = "Dashboard" )]
        public ActionResult BasicPostList( int top )
        {
            IQueryable<Post> model = postService.SelectRecordList( Post.WhereDisplayEquals( true ) ).OrderByDescending( t => t.PublishDateTime ).Take( top );
            return PartialView( "BasicPostListControl", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Category( string id, string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            UserSearchArea userSearchArea = jumblistSession.UserSearchArea;
            ResetAuthUserSearchDetails( ref userSearchArea, user );

            PostCategory postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( id ) );

            int currentPage = page.HasValue ? page.Value - 1 : 0;
            int currentPageSize = CalculatePageSize( pageSize, jumblistSession.PageSize );

            string pageTitle = postCategory.Name + " Posts";
            if ( !string.IsNullOrEmpty( q ) ) pageTitle += " filtered by search term '" + q + "'";

            IEnumerable<Post> postList = postService.SelectRecordList( postCategory, q.ToFriendlyQueryStringDecode(), jumblistSession.UserSearchArea ).OrderByDescending( t => t.PublishDateTime );
            IPagedList<Post> pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
            IEnumerable<Pushpin> pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

            PostViewModel model = BuildPostViewModel();

            model.Q = q;
            model.User = user;
            model.UserSearchArea = jumblistSession.UserSearchArea;
            model.PostCategory = postCategory;
            model.WithSelectList( typeof( PostCategory ), PostCategorySearchSelectList() );
            model.Tags = new List<Tag>();
            model.Pushpins = pushpinList;
            model.PagedList = pagedPostList;
            model.PageTitle = pageTitle;
            model.ListCount = postList.Count();

            if ( model.ListCount == 0 )
            {
                model.Message = new Message { Text = "Sorry, there are no posts categorised by " + id + " with this search term - " + q + ".", StyleClass = "message" };
            }

            jumblistSession.PostListRouteValues.Update( "Category", id, q );
            jumblistSession.PageSize = currentPageSize;

            return View( "index", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Group( string id, string category, string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            UserSearchArea userSearchArea = jumblistSession.UserSearchArea;
            ResetAuthUserSearchDetails( ref userSearchArea, user );

            Feed feed = feedService.SelectRecord( Feed.WhereFriendlyUrlEquals( id ) );
            PostCategory postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );

            int currentPage = page.HasValue ? page.Value - 1 : 0;
            int currentPageSize = CalculatePageSize( pageSize, jumblistSession.PageSize );

            string pageTitle = category.ToTitleCase() + " Posts from " + feed.Name;
            if ( !string.IsNullOrEmpty( q ) ) pageTitle += " filtered by search term '" + q + "'";

            IEnumerable<Post> postList = postService.SelectRecordList( feed, postCategory, q.ToFriendlyQueryStringDecode(), jumblistSession.UserSearchArea ).OrderByDescending( t => t.PublishDateTime ); ;
            IPagedList<Post> pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
            IEnumerable<Pushpin> pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

            PostViewModel model = BuildPostViewModel();

            model.Group = feed;
            model.Q = q;
            model.User = user;
            model.UserSearchArea = jumblistSession.UserSearchArea;
            model.PostCategory = postCategory ?? new PostCategory();
            model.WithSelectList( typeof( PostCategory ), PostCategorySearchSelectList() );
            model.Tags = new List<Tag>();
            model.Pushpins = pushpinList;
            model.PagedList = pagedPostList;
            model.PageTitle = pageTitle;
            model.ListCount = postList.Count();

            if ( model.ListCount == 0 )
            {
                model.Message = new Message { Text = "Sorry, there are no posts from this group - " + id + " with search term " + q + ".", StyleClass = "message" };
            }

            jumblistSession.PostListRouteValues.Update( "Group", id, category, q );
            jumblistSession.PageSize = currentPageSize;

            return View( "index", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Located( string id, string category, string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            IEnumerable<Location> locationList = locationService.SelectRecordList( Location.WhereFriendlyUrlListEqualsOr( id.ToFriendlyUrlDecode() ) );
            PostCategory postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );

            int currentPage = page.HasValue ? page.Value - 1 : 0;
            int currentPageSize = CalculatePageSize( pageSize, jumblistSession.PageSize );

            string pageTitle = category.ToTitleCase() + " Posts from the following locations, " + locationList.Select( x => x.Name ).ToFormattedStringList( "{0}, ", 2 );
            if ( !string.IsNullOrEmpty( q ) ) pageTitle += " filtered by search term '" + q + "'";

            IEnumerable<Post> postList = postService.SelectRecordList( locationList, postCategory, q.ToFriendlyQueryStringDecode() ).OrderByDescending( t => t.PublishDateTime ); ;
            IPagedList<Post> pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
            IEnumerable<Pushpin> pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

            PostViewModel model = BuildPostViewModel();

            model.Locations = locationList;
            model.Q = q;
            model.User = user;
            model.PostCategory = postCategory ?? new PostCategory();
            model.WithSelectList( typeof( PostCategory ), PostCategorySearchSelectList() );
            model.Tags = new List<Tag>();                
            model.Pushpins = pushpinList;
            model.PagedList = pagedPostList;
            model.PageTitle = pageTitle;
            model.ListCount = postList.Count();

            if ( model.ListCount == 0 )
            {
                model.Message = new Message { Text = "Sorry, there are no posts from this location - " + id + ".", StyleClass = "message" };
            }

            jumblistSession.PostListRouteValues.Update( "Located", id, category, q );
            jumblistSession.PageSize = currentPageSize;

            return View( "index", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Tagged( string id, string category, string q, int? page, int? pageSize, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            UserSearchArea userSearchArea = jumblistSession.UserSearchArea;
            ResetAuthUserSearchDetails( ref userSearchArea, user );

            IEnumerable<Tag> tagList = tagService.SelectRecordList( Tag.WhereFriendlyUrlListEqualsOr( id.ToFriendlyUrlDecode() ) );
            PostCategory postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );

            int currentPage = page.HasValue ? page.Value - 1 : 0;
            int currentPageSize = CalculatePageSize( pageSize, jumblistSession.PageSize );

            string pageTitle = category.ToTitleCase() + " Posts tagged with " + tagList.Select( x => x.Name ).ToFormattedStringList( "{0}, ", 2 );
            if ( !string.IsNullOrEmpty( q ) ) pageTitle += " filtered by search term '" + q + "'";

            IEnumerable<Post> postList = postService.SelectRecordList( tagList, postCategory, q.ToFriendlyQueryStringDecode(), jumblistSession.UserSearchArea ).OrderByDescending( t => t.PublishDateTime ); ;
            IPagedList<Post> pagedPostList = postList.ToPagedList( currentPage, currentPageSize );
            IEnumerable<Pushpin> pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

            PostViewModel model = BuildPostViewModel();

            model.Q = q;
            model.User = user;
            model.UserSearchArea = jumblistSession.UserSearchArea;
            model.PostCategory = postCategory ?? new PostCategory();
            model.WithSelectList( typeof( PostCategory ), PostCategorySearchSelectList() );
            model.Tags = tagList; 
            model.Pushpins = pushpinList;
            model.PagedList = pagedPostList;
            model.PageTitle = pageTitle;
            model.ListCount = postList.Count();

            if ( model.ListCount == 0 )
            {
                string contains = (!string.IsNullOrEmpty(q)) ? " containing the search terms " + q : string.Empty;
                model.Message = new Message { Text = "Sorry, there are no posts tagged with <span class='highlight'>" + tagList.Select( x => x.Name ).ToFormattedStringList("{0}, ", 2) + "</span>" + contains, StyleClass = "message" };
            }

            jumblistSession.PostListRouteValues.Update( "Tagged", id, category, q );
            jumblistSession.PageSize = currentPageSize;

            return View( "index", model );
         }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Detail( int id, string name, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            var item = postService.SelectRecord( id );

            item.NumberofViews += 1;
            postService.Save( item );

            var model = BuildDefaultViewModel().With( item );

            model.User = user;
            model.PageTitle = item.Title;

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateInput( true )]
        public RedirectToRouteResult Search( string postCategorySelection, string tagSearch, string locationSearch, int? locationRadius, string groupHidden, string locationHidden, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            if ( !string.IsNullOrEmpty( locationSearch ) )
            {
                locationSearch = locationSearch.ToCleanSearchString();
                int radius = (locationRadius.HasValue) ? (int)locationRadius : defaultLocationRadius;
                BingLocationService locationSearchCoordinates = new BingLocationService( locationSearch + ", UK" );
                jumblistSession.UserSearchArea.Update( locationSearch, radius, locationSearchCoordinates.Latitude, locationSearchCoordinates.Longitude );
            }
            else
            {
                jumblistSession.UserSearchArea.Reset();
            }
 
            searchService.TagSearch = tagSearch.ToCleanSearchString();
            searchService.PostCategorySelection = postCategorySelection ?? string.Empty;
            searchService.GroupHidden = groupHidden ?? string.Empty;
            searchService.LocationHidden = locationHidden ?? string.Empty;

            PostListRouteValues postListRouteValues = searchService.ExecuteSearch();

            return RedirectToAction( postListRouteValues.Action, new RouteValueDictionary( new { id = postListRouteValues.Id, category = postListRouteValues.Category, q = postListRouteValues.Q } ) );
        }


        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Email( int id, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            Post post = postService.SelectRecord( id );
            mailService.SendPostEmail( post, user );

            //postService.SendPostEmail( id, user );
            Message model = new Message { Text = "The post details have been emailed to you.", StyleClass = "message" };
            return PartialView( "MessageControl", model );
        }


        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult EmailAlert( string returnUrl, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            if ( !user.IsAuthenticated )
            {
                Message = new Message { Text = "You need to be registered and logged in to create an email alert.", StyleClass = "message" };
                return RedirectToAction( "login", "users", new { returnUrl = returnUrl } );
            }

            var model = DefaultView.CreateModel<UserAlert>();
            model.PageTitle = "Create Email Alert";
            model.PostListRouteValues = jumblistSession.PostListRouteValues;
            model.UserSearchArea = jumblistSession.UserSearchArea;

            return View( model );

        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateAntiForgeryToken]
        public ActionResult EmailAlert( UserAlert item, string returnUrl, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            item.PostListRouteValues = Serializer.Serialize( jumblistSession.PostListRouteValues );
            item.SearchArea = Serializer.Serialize( jumblistSession.UserSearchArea );
            item.DateTimeCreated = DateTime.Now;
            item.DateTimeLastSent = DateTime.Now;
            item.IsActive = true;
            item.UserId = user.UserId;

            try
            {
                userAlertService.Save( item, true );

                Message = new Message { Text = "Your email alert has been saved.", StyleClass = "message" };
                return Redirect( returnUrl ?? "/" );
            }
            catch ( RulesException ex )
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = DefaultView.CreateModel<UserAlert>().With( item );
            model.PageTitle = "Edit alert";
            model.Message = new Message { Text = "Sorry, there was a problem. Please try again.", StyleClass = "error" };
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Add( [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            if ( !user.IsAuthenticated )
            {
                Message = new Message { Text = "You need to be registered and logged in to create a post.", StyleClass = "message" };
                return RedirectToAction( "login", "users", new { returnUrl = Url.Action( "add", "posts" ) } );
            }

            PostViewModel model = BuildPostViewModel();

            model.Item = new Post();
            model.WithSelectList( typeof( PostCategory ), PostCategoryAddPostSelectList() );
            model.PageTitle = "Create a new post";
            //model.Message = new Message { Text = "You are about to create a post", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateAntiForgeryToken]
        public ActionResult Add( Post item, string returnUrl, [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            item.PublishDateTime = DateTime.Now;
            item.LastUpdatedDateTime = DateTime.Now;
            item.Display = true;
            item.Latitude = user.Latitude;
            item.Longitude = user.Longitude;
            item.UserId = user.UserId;
            
            string tags = Request.Form["Item.Tags"];
            if ( string.IsNullOrEmpty( tags ) ) tags = item.Title + ' ' + item.Body; 

            try
            {
                postService.Save( item, true );
                postService.SavePostTags( item, tags );

                Message = new Message { Text = "Your post '" + item.Title + "' has been saved.", StyleClass = "message" };
                return Redirect( returnUrl ?? "/" );
            }
            catch ( RulesException ex )
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Title );
            model.Message = new Message { Text = "Sorry, there was a problem. Please try again.", StyleClass = "error" };
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get ), OutputCache( CacheProfile = "Dashboard" )]
        public RssResult Rss( string rssActionName, string rssActionId, string rssActionCategory, string q, [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession )
        {
            UserSearchArea userSearchArea = jumblistSession.UserSearchArea;
            ResetAuthUserSearchDetails( ref userSearchArea, user );

            //PostListRouteValues postListRouteValues = (PostListRouteValues)Serializer.Deserialize( "AAEAAAD/////AQAAAAAAAAAMAgAAAERKdW1ibGlzdC5Db3JlLCBWZXJzaW9uPTEuMC4wLjAsIEN1bHR1cmU9bmV1dHJhbCwgUHVibGljS2V5VG9rZW49bnVsbAUBAAAAJ0p1bWJsaXN0LkNvcmUuTW9kZWwuUG9zdExpc3RSb3V0ZVZhbHVlcwQAAAAXPEFjdGlvbj5rX19CYWNraW5nRmllbGQTPElkPmtfX0JhY2tpbmdGaWVsZBk8Q2F0ZWdvcnk+a19fQmFja2luZ0ZpZWxkEjxRPmtfX0JhY2tpbmdGaWVsZAEBAQECAAAABgMAAAAGVGFnZ2VkBgQAAAAEYmFieQoKCw==" );
            //UserSearchArea userSearchArea = (UserSearchArea)Serializer.Deserialize( "AAEAAAD/////AQAAAAAAAAAMAgAAAERKdW1ibGlzdC5Db3JlLCBWZXJzaW9uPTEuMC4wLjAsIEN1bHR1cmU9bmV1dHJhbCwgUHVibGljS2V5VG9rZW49bnVsbAUBAAAAIkp1bWJsaXN0LkNvcmUuTW9kZWwuVXNlclNlYXJjaEFyZWEEAAAAHTxMb2NhdGlvbk5hbWU+a19fQmFja2luZ0ZpZWxkFzxSYWRpdXM+a19fQmFja2luZ0ZpZWxkGTxMYXRpdHVkZT5rX19CYWNraW5nRmllbGQaPExvbmdpdHVkZT5rX19CYWNraW5nRmllbGQBAAAACAYGAgAAAAYDAAAACHRuMzEgNmhnBQAAAAAAQPtRd0lAAAAAAO2W4j8L" );

            //IEnumerable<Post> postList = postService.GetPostList( postListRouteValues, userSearchArea )
            //    .Where( x => x.LastUpdatedDateTime > DateTime.Now.AddDays( -5 ) );

            SyndicationFeed feed =
                new SyndicationFeed( "Jumblist Feed",
                                    "This is a jumblist feed",
                                    new Uri( defaultUrl ),
                                    "TestFeedID",
                                    DateTime.Now );

            IEnumerable<Post> postList = postService.GetPostList( rssActionName, rssActionId, rssActionCategory, q, jumblistSession.UserSearchArea )
                .Where( x => x.LastUpdatedDateTime > DateTime.Now.AddDays( -30 ) );

            IEnumerable<SyndicationItem> items = postList.Select( x => (
                new SyndicationItem( x.Title, x.Body.ToShortDescription(), new Uri( defaultUrl + x.LinkbackUrl ), x.PostId.ToString(), x.PublishDateTime ) 
                { 
                    PublishDate = x.PublishDateTime 
                }
            ));
            
            feed.Items = items;

            return Rss( feed );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public XmlSitemapResult XmlSiteMap()
        {
            List<ISitemapItem> siteMapItems = new List<ISitemapItem>();
            
            //AddPosts();

            IEnumerable<Post> postList = postService.SelectRecordList()
                .OrderByDescending( t => t.PublishDateTime )
                .Where( x => x.LastUpdatedDateTime > DateTime.Now.AddDays( -60 ) );

            foreach ( Post post in postList )
            {
                siteMapItems.Add( 
                    new SitemapItem( defaultUrl + post.LinkbackUrl )
                    {
                        LastModified = post.LastUpdatedDateTime,
                        Priority = 1
                    }
                );
            }

            //AddPages();

            return new XmlSitemapResult( siteMapItems );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult MapTest()
        {
            return View();
        }

        [NonAction]
        private int CalculatePageSize( int? QuerystringPageSize, int? SessionPageSize )
        {
            if ( QuerystringPageSize.HasValue )
            {
                return (int)QuerystringPageSize;
            }
            else
            {
                return SessionPageSize ?? defaultPageSize;
            }
        }

        [NonAction]
        private void ResetAuthUserSearchDetails( ref UserSearchArea userSearchArea, User user )
        {
            if ( user.IsAuthenticated && string.IsNullOrEmpty( userSearchArea.LocationName ) )
            {
                userSearchArea.Update( user.Postcode, user.Radius, user.Latitude, user.Longitude );
            }
        }

        [NonAction]
        private IList<PostCategory> PostCategorySearchSelectList()
        {
            IList<PostCategory> list = new List<PostCategory>();

            list.Add( new PostCategory() { Name = "All", SelectListValue = "" } );
            list.Add( new PostCategory() { Name = PostCategoryId.Offered.ToString(), SelectListValue = PostCategoryId.Offered.ToString().ToLower() } );
            list.Add( new PostCategory() { Name = PostCategoryId.Wanted.ToString(), SelectListValue = PostCategoryId.Wanted.ToString().ToLower() } );

            return list;
        }

        [NonAction]
        private IList<PostCategory> PostCategoryAddPostSelectList()
        {
            IList<PostCategory> list = new List<PostCategory>();

            list.Add( new PostCategory() { Name = PostCategoryId.Offered.ToString(), SelectListValue = ((int)PostCategoryId.Offered).ToString() } );
            list.Add( new PostCategory() { Name = PostCategoryId.Wanted.ToString(), SelectListValue = ((int)PostCategoryId.Wanted).ToString() } );

            return list;
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
        //        IPagedList<Post> pagedPostList = postList.ToPagedList( currentPage, currentPageSize );

        //        IEnumerable<Pushpin> pushpinList = postList.ToFilteredPushPinList( Post.WhereLatLongValuesExist() ).Take( currentPageSize );

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

        //public ActionResult SelectCategory( RouteValueDictionary routeValueDic, string highlightedCategory )
        //{
        //    var postCategoryList = postCategoryService.SelectRecordList(PostCategory.WhereIsNavigationEquals(true));

        //    List<Link> model = new List<Link>();

        //    model.Add(new CategoryLink(null, routeValueDic) { IsSelected = (string.IsNullOrEmpty(highlightedCategory)) });

        //    foreach (var category in postCategoryList)
        //    {
        //        model.Add(new CategoryLink(category.Name, routeValueDic) { IsSelected = (highlightedCategory.Equals(category.Name, StringComparison.OrdinalIgnoreCase)) });
        //    }

        //    return PartialView("SelectCategoryControl",model);
        //}
    }
}
