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

        public PostsController(IPostService postService, ILocationService locationService, ITagService tagService, IDataService<Feed> feedService, IDataService<PostCategory> postCategoryService, ISearchService searchService)
        {
            this.postService = postService;
            this.locationService = locationService;
            this.tagService = tagService;
            this.feedService = feedService;
            this.postCategoryService = postCategoryService;
            this.searchService = searchService;
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
        public ActionResult Category(string id, int? page)
        {
            try
            {
                var postCategory = postCategoryService.SelectRecord(PostCategory.WhereNameEquals(id));
                var postList = postService.SelectRecordList(Post.WherePostCategoryEquals(postCategory).And(Post.WhereDisplayEquals(true))).OrderByDescending(t => t.PublishDateTime);
                var pagedPostList = new PaginatedList<Post>(postList.ToList(), (page ?? 1), frontEndPageSize);

                var model = BuildDefaultViewModel().With(pagedPostList);
                model.PageTitle = postCategory.Name + " Posts";
                model.ListCount = postList.Count();

                return View("index", model);
            }
            catch (Exception)
            {
                PageTitle = "Sorry we have a problem";
                Message = new Message { Text = "We could not find this category - " + id, StyleClass = "message" };
                return RedirectToAction("problem");
            }

            
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Group( string id, string category, string q, int? page )
        {
            try
            {
                var feed = feedService.SelectRecord(Feed.WhereFriendlyUrlEquals(id));
                IEnumerable<Post> postList;

                if (!string.IsNullOrEmpty(category))
                {
                    var postCategory = postCategoryService.SelectRecord(PostCategory.WhereNameEquals(category));
                    postList = postService.SelectRecordList(Post.WherePostCategoryEquals(postCategory).And(Post.WhereDisplayEquals(true)).And(Post.WhereFeedEquals(feed))).OrderByDescending(t => t.PublishDateTime).Distinct();

                }
                else
                {
                    postList = postService.SelectRecordList(Post.WhereFeedEquals(feed).And(Post.WhereDisplayEquals(true))).OrderByDescending(t => t.PublishDateTime);
                }

                if (!string.IsNullOrEmpty( q ))
                    postList = postList.AsQueryable().Where( Post.WhereSearchTextEquals( q ) );

                var pagedPostList = new PaginatedList<Post>(postList.ToList(), (page ?? 1), frontEndPageSize);

                var model = BuildDefaultViewModel().With(pagedPostList);
                model.PageTitle = "All " + category + " Posts by Group - " + feed.Name;
                model.ListCount = postList.Count();

                if (postList.Count() == 0)
                    model.Message = new Message { Text = "No posts from this group - " + id, StyleClass = "message" };

                return View("index", model);
            }
            catch (Exception ex)
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this group - " + id, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Located( string id, string category, string q, int? page )
        {
            try
            {
                var locationList = locationService.SelectRecordList(Location.WhereFriendlyUrlListEqualsOr(id.FriendlyUrlDecode()));
                IEnumerable<Post> postList;

                if (!string.IsNullOrEmpty(category))
                {
                    var postCategory = postCategoryService.SelectRecord(PostCategory.WhereNameEquals(category));
                    postList = postService.SelectRecordList(Post.WherePostCategoryEquals(postCategory).And(Post.WhereDisplayEquals(true)), PostLocation.WhereLocationNameListEqualsOr(locationList)).OrderByDescending(t => t.PublishDateTime).Distinct();
                }
                else
                {
                    postList = postService.SelectRecordList(Post.WhereDisplayEquals(true), PostLocation.WhereLocationNameListEqualsOr(locationList)).OrderByDescending(t => t.PublishDateTime).Distinct();
                }

                if (!string.IsNullOrEmpty( q ))
                    postList = postList.AsQueryable().Where( Post.WhereSearchTextEquals( q ) );

                var pagedPostList = new PaginatedList<Post>( postList.ToList(), (page ?? 1), frontEndPageSize );

                var model =  BuildDefaultViewModel().With( pagedPostList );
                model.PageTitle = "All " + category + " Posts by Location - " + locationList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2);
                model.ListCount = postList.Count();

                if (postList.Count() == 0) 
                    model.Message = new Message { Text = "No posts from this location - " + id, StyleClass = "message" };

                return View("index", model);
            }
            catch (Exception ex)
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this location - " + id, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Tagged( string id, string category, string q, int? page )
        {
            try
            {
                var tagList = tagService.SelectRecordList(Tag.WhereFriendlyUrlListEqualsOr(id.FriendlyUrlDecode()));

                var postList = postService.SelectRecordList(tagList, category, q);

                //IEnumerable<Post> postList;

                //if (!string.IsNullOrEmpty(category))
                //{
                //    var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
                //    postList = postService.SelectRecordList(Post.WherePostCategoryEquals(postCategory).And(Post.WhereDisplayEquals(true)).And(Post.WhereTagNameListEqualsAnd(tagList))).OrderByDescending(t => t.PublishDateTime);
                //}
                //else
                //{
                //    postList = postService.SelectRecordList(Post.WhereDisplayEquals(true).And(Post.WhereTagNameListEqualsAnd(tagList))).OrderByDescending(t => t.PublishDateTime);
                //}

                //if (!string.IsNullOrEmpty(q))
                //    postList = postList.ToFilteredList(Post.WhereSearchTextEquals(q));

                var pushpinList = postList.ToFilteredPushPinList(Post.WhereLocationExists());

                var pagedPostList = postList.ToPagedList(page, frontEndPageSize);

                var model = PostView.Model();

                model.Pushpins = pushpinList;
                model.PaginatedList = pagedPostList;
                model.PageTitle = "All " + category + " Posts by Tag - " + tagList.Select( x => x.Name ).ToFormattedStringList( "{0}, ", 2 );
                model.ListCount = postList.Count();

                if (postList.Count() == 0)
                    model.Message = new Message { Text = "No posts tagged with " + tagList.Select( x => x.Name ).ToFormattedStringList( "{0}, ", 2 ), StyleClass = "message" };

                return View("index", model);
            }
            catch (Exception ex)
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this tag - " + id, StyleClass = "message" };
                return RedirectToAction("problem");
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult TaggedLocations( string tagged, string located, string category, string q, int? page )
        {
            try
            {
                var tagList = tagService.SelectRecordList( Tag.WhereFriendlyUrlListEqualsOr( tagged.FriendlyUrlDecode() ) );
                var locationList = locationService.SelectRecordList( Location.WhereFriendlyUrlListEqualsOr(located.FriendlyUrlDecode()) );

                IEnumerable<Post> postList;

                if (!string.IsNullOrEmpty( category ))
                {
                    var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
                    postList = postService.SelectRecordList( Post.WherePostCategoryEquals( postCategory ).And( Post.WhereDisplayEquals( true ) ).And( Post.WhereTagNameListEqualsAnd( tagList ) ), PostLocation.WhereLocationNameListEqualsOr(locationList) ).OrderByDescending( t => t.PublishDateTime );
                }
                else
                {
                    postList = postService.SelectRecordList( Post.WhereDisplayEquals( true ).And( Post.WhereTagNameListEqualsAnd( tagList ) ), PostLocation.WhereLocationNameListEqualsOr( locationList ) ).OrderByDescending( t => t.PublishDateTime );
                }

                if (!string.IsNullOrEmpty( q ))
                    postList = postList.AsQueryable().Where( Post.WhereSearchTextEquals( q ) );

                var pagedPostList = new PaginatedList<Post>(postList.ToList(), (page ?? 1), frontEndPageSize);

                var model = BuildDefaultViewModel().With( pagedPostList );
                model.PageTitle = "All " + category + " Posts by Tag - " + tagList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2);
                model.PageTitle += "All " + category + " Posts by Location - " + locationList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2);
                model.ListCount = postList.Count();

                if (postList.Count() == 0)
                {
                    model.Message = new Message { Text = "No posts tagged with " + tagList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2), StyleClass = "message" };
                    model.Message = new Message { Text = "No posts located at " + locationList.Select(x => x.Name).ToFormattedStringList("{0}, ", 2), StyleClass = "message" };
                }

                return View("index", model);
            }
            catch (Exception ex)
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this tag - " + tagged + " or location - " + located, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Search( string q, string category, int? page )
        {
            try
            {
                IEnumerable<Post> postList;

                if (!string.IsNullOrEmpty( category ))
                {
                    var postCategory = postCategoryService.SelectRecord( PostCategory.WhereNameEquals( category ) );
                    postList = postService.SelectRecordList( Post.WherePostCategoryEquals( postCategory ).And( Post.WhereDisplayEquals( true ) ).And( Post.WhereSearchTextEquals( q ) ) ).OrderByDescending( t => t.PublishDateTime );
                }
                else
                {
                    postList = postService.SelectRecordList( Post.WhereDisplayEquals( true ).And( Post.WhereSearchTextEquals( q ) ) ).OrderByDescending( t => t.PublishDateTime );
                }

                var pagedPostList = new PaginatedList<Post>( postList.ToList(), (page ?? 1), frontEndPageSize );

                var model = BuildDefaultViewModel().With( pagedPostList );
                model.PageTitle = "All " + category + " Posts with the following search terms - " + q;
                model.ListCount = postList.Count();

                if (postList.Count() == 0)
                    model.Message = new Message { Text = "No posts with the following search terms " + q, StyleClass = "message" };


                return View( "index", model );
            }
            catch (Exception ex)
            {
                PageTitle = "Sorry we have a problem" + ex.Message;
                Message = new Message { Text = "We could not find this search term " + q, StyleClass = "message" };
                return RedirectToAction( "problem" );
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(true)]
        public RedirectToRouteResult Search( string searchString, string searchOptions )
        {
            searchService.UserInputSearchString = searchString.ToCleanSearchString();
            searchService.UserInputSearchOptions = searchOptions;
            searchService.Tags = tagService.SelectTagNameList();
            searchService.Locations = locationService.SelectLocationNameTownList();

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
