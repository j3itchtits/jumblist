using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StuartClode.Mvc.Extension;
using Jumblist.Core.Service;
using System.Text.RegularExpressions;
using System.Collections;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Model;
using StuartClode.Mvc.Service.Map;
using System.Web;

namespace Jumblist.Core.Service
{
    public class SearchService : ISearchService
    {
        //private string[] tags;
        //private string[] locations;
        public ITagService tagService;
       // public ILocationService locationService;

        public SearchService( ITagService tagService )
        {
            this.tagService = tagService;
            //this.locationService = locationService;
        }

        public string TagSearch { get; set; }
        public string GroupSearch { get; set; }
        public string PostCategorySearch { get; set; }

        //public string[] Tags 
        //{
        //    get { return tagService.SelectTagNameList(); }
        //    set { tags = value; }
        //}
        
        //public string[] Locations
        //{
        //    get { return locationService.SelectLocationNameTownList(); }
        //    set { locations = value; }
        //}

        public SearchResult ProcessSearch()
        {
            //if ( TagSearch.Length == 0 )
            //{
            //    if ( GroupSearch.Length > 0 )
            //    {
            //        return new SearchResult { ActionName = "group", RouteValues = new { id = GroupSearch, category = PostCategorySearch } };
            //    }
            //    else if ( PostCategorySearch.Length > 0 )
            //    {
            //        return new SearchResult { ActionName = "category", RouteValues = new { id = PostCategorySearch } };
            //    }
            //    else
            //    {
            //        return new SearchResult { ActionName = "index", RouteValues = null };
            //    }
            //}
            string tagPath = string.Empty;
            string q = string.Empty;

            if ( TagSearch.Length > 0 )
            {
                string tagSearchPattern = TagSearch.ToSearchRegexPattern();
                var tagMatches = Regex.Matches( tagService.SelectTagNameList().ToNewLineDelimitedString(), tagSearchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );
                bool isCompleteSearchMatch = IsSearchCompleteMatch( tagMatches, out q );
                tagPath = ( (IEnumerable)tagMatches ).ToFriendlyUrlEncode();
            }

            if ( tagPath.Length == 0 )
            {
                if ( GroupSearch.Length > 0 )
                {
                    return new SearchResult { ActionName = "group", RouteValues = new { id = GroupSearch, category = PostCategorySearch, q = q } };
                }
                else if ( PostCategorySearch.Length > 0 )
                {
                    return new SearchResult { ActionName = "category", RouteValues = new { id = PostCategorySearch, q = q } };
                }
                else
                {
                    return new SearchResult { ActionName = "index", RouteValues = new { q = q } };
                }
            }
            else
            {
                if ( GroupSearch.Length > 0 )
                {
                    return new SearchResult { ActionName = "group", RouteValues = new { id = GroupSearch, category = PostCategorySearch, q = tagPath + ' ' + q } };
                }
                else
                {
                    return new SearchResult { ActionName = "tagged", RouteValues = new { id = tagPath, category = PostCategorySearch, q = q } };
                }
            }


            //Get User entity - what about anonymous users?
            //Add LocationSearch to User entity - this can then be used in the PostController to filter the tagged or search post list
            // note - actually we might not need locationsearch at all - perhaps this logic can be incorporated into the controllers

            //var locationMatches = Regex.Matches(Locations.ToNewLineDelimitedString(), searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline);




            //string locationQueryString = ((IEnumerable)locationMatches).ToFriendlyUrlEncode();





            //if (tagQueryString.Length == 0 && locationQueryString.Length > 0)
            //{
            //    actionName = "located";
            //    routeValues = new { id = locationQueryString, category = PostCategorySearch, q = q, page = string.Empty };
            //}

            //if (tagQueryString.Length > 0 && locationQueryString.Length > 0)
            //{
            //    actionName = "taggedlocations";
            //    routeValues = new { tagged = tagQueryString, located = locationQueryString, category = PostCategorySearch, q = q, page = string.Empty };
            //}

            
        }


        private bool IsSearchCompleteMatch( MatchCollection tagMatches, out string q )
        {
            var tagMatchesCompareString = ((IEnumerable)tagMatches).ToFormattedStringList("{0} ");

            //var locationMatchesCompareString = ((IEnumerable)locationMatches).ToFormattedStringList("{0} ");
            //var combinedCompareString = (tagMatchesCompareString + locationMatchesCompareString).Trim();

            bool match = string.Compare(TagSearch.ToAlphabetical(), tagMatchesCompareString.ToAlphabetical(), true) == 0;
            q = string.Empty;

            if (!match)
	        {
                IEnumerable<string> difference = (TagSearch.ToLower().Split(' ')).Except(tagMatchesCompareString.ToLower().Split(' '));
                q = difference.ToFriendlyQueryStringEncode();
	        }

            return match;
        }
    }
}
