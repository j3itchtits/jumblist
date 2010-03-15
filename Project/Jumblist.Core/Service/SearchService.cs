using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StuartClode.Mvc.Extension;
using Jumblist.Core.Service.Data;
using System.Text.RegularExpressions;
using System.Collections;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public class SearchService : ISearchService
    {
        public string UserInputSearchString { get; set; }
        public string UserInputSearchOptions { get; set; }
        public string[] Tags { get; set; }
        public string[] Locations { get; set; }

        public SearchResult ProcessSearch()
        {
            var searchPattern = UserInputSearchString.ToSearchRegexPattern();

            var tagMatches = Regex.Matches( string.Join( "\n", Tags ), searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );
            var locationMatches = Regex.Matches( string.Join( "\n", Locations ), searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline );
            
            bool isCompleteSearchMatch = IsSearchCompleteMatch( tagMatches, locationMatches );
            string tagQueryString = ((IEnumerable)tagMatches).ToFormattedStringList( "{0}, ", 2 ).ToFriendlyUrl();
            string locationQueryString = ((IEnumerable)locationMatches).ToFormattedStringList( "{0}, ", 2 ).ToFriendlyUrl();

            string actionName = string.Empty;
            object routeValues = new object();

            if (isCompleteSearchMatch)
            {
                if (tagQueryString.Length > 0 && locationQueryString.Length == 0)
                {
                    actionName = "tagged";
                    routeValues = new { id = tagQueryString, category = UserInputSearchOptions, page = string.Empty };
                }

                if (tagQueryString.Length == 0 && locationQueryString.Length > 0)
                {
                    actionName = "located";
                    routeValues = new { id = locationQueryString, category = UserInputSearchOptions, page = string.Empty };
                }

                if (tagQueryString.Length > 0 && locationQueryString.Length > 0)
                {
                    actionName = "search";
                    routeValues = new { tagged = tagQueryString, located = locationQueryString, category = UserInputSearchOptions, page = string.Empty };
                }
            }
            else
            {
                actionName = "search";
                routeValues = new { q = tagQueryString + locationQueryString, category = UserInputSearchOptions, page = string.Empty };
            }

            var searchResult = new SearchResult { ActionName = actionName, RouteValues = routeValues };

            return searchResult;
        }




        private bool IsSearchCompleteMatch( MatchCollection tagMatches, MatchCollection locationMatches )
        {
            var tagMatchesCompareString = ((IEnumerable)tagMatches).ToFormattedStringList("{0} ");
            var locationMatchesCompareString = ((IEnumerable)locationMatches).ToFormattedStringList("{0} ");
            var compareString = (tagMatchesCompareString + locationMatchesCompareString).Trim();

            return string.Compare(UserInputSearchString.ToAlphabetical(), compareString.ToAlphabetical(), true) == 0;
        }
    }
}
