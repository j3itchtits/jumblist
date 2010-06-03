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
        public string GroupHidden { get; set; }
        public string PostCategorySelection { get; set; }
        public string LocationHidden { get; set; }

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
            string q = string.Empty;
            string tagRegex = TagSearch.ToSearchRegexPattern();
            string tagList = tagService.SelectTagNameList().ToNewLineDelimitedString();
            MatchCollection tagMatches = Regex.Matches( tagList, tagRegex, RegexOptions.IgnoreCase | RegexOptions.Multiline );
            bool isCompleteSearchMatch = IsSearchCompleteMatch( tagMatches, out q );
            string tagPath = ((IEnumerable)tagMatches).ToFriendlyUrlEncode();

            if ( tagPath.Length == 0 )
            {
                if ( GroupHidden.Length > 0 )
                {
                    return new SearchResult { ActionName = "group", RouteValues = new { id = GroupHidden, category = PostCategorySelection, q = q } };
                }
                else if ( LocationHidden.Length > 0 )
                {
                    return new SearchResult { ActionName = "located", RouteValues = new { id = LocationHidden, category = PostCategorySelection, q = q } };
                }
                else if ( PostCategorySelection.Length > 0 )
                {
                    return new SearchResult { ActionName = "category", RouteValues = new { id = PostCategorySelection, q = q } };
                }
                else
                {
                    return new SearchResult { ActionName = "index", RouteValues = new { q = q } };
                }
            }
            else
            {
                if ( GroupHidden.Length > 0 )
                {
                    q = (((IEnumerable)tagMatches).ToFriendlyQueryStringEncode() + ' ' + q).Trim();
                    return new SearchResult { ActionName = "group", RouteValues = new { id = GroupHidden, category = PostCategorySelection, q = q } };
                }
                else if ( LocationHidden.Length > 0 )
                {
                    q = (((IEnumerable)tagMatches).ToFriendlyQueryStringEncode() + ' ' + q).Trim();
                    return new SearchResult { ActionName = "located", RouteValues = new { id = LocationHidden, category = PostCategorySelection, q = q } };
                }
                else
                {
                    return new SearchResult { ActionName = "tagged", RouteValues = new { id = tagPath, category = PostCategorySelection, q = q } };
                }
            }
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
                IEnumerable<string> difference = (TagSearch.ToLower().Split(' ')).Except( tagMatchesCompareString.ToLower().Split(' ') );
                q = difference.ToFriendlyQueryStringEncode();
	        }

            return match;
        }
    }
}
