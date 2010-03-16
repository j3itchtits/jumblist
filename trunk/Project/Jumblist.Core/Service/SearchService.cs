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

            var tagMatches = Regex.Matches(Tags.ToNewLineDelimitedString(), searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline);
            var locationMatches = Regex.Matches(Locations.ToNewLineDelimitedString(), searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline);

            string q;
            bool isCompleteSearchMatch = IsSearchCompleteMatch( tagMatches, locationMatches, out q );
            string tagQueryString = ((IEnumerable)tagMatches).FriendlyUrlEncode();
            string locationQueryString = ((IEnumerable)locationMatches).FriendlyUrlEncode();

            string actionName = string.Empty;
            object routeValues = new object();

            if (tagQueryString.Length > 0 && locationQueryString.Length == 0)
            {
                actionName = "tagged";
                routeValues = new { id = tagQueryString, category = UserInputSearchOptions, q = q, page = string.Empty };
            }

            if (tagQueryString.Length == 0 && locationQueryString.Length > 0)
            {
                actionName = "located";
                routeValues = new { id = locationQueryString, category = UserInputSearchOptions, q = q, page = string.Empty };
            }

            if (tagQueryString.Length > 0 && locationQueryString.Length > 0)
            {
                actionName = "taggedlocations";
                routeValues = new { tagged = tagQueryString, located = locationQueryString, category = UserInputSearchOptions, q = q, page = string.Empty };
            }

            if (tagQueryString.Length == 0 && locationQueryString.Length == 0)
            {
                actionName = "search";
                routeValues = new { q = q, category = UserInputSearchOptions, page = string.Empty };
            }

            var searchResult = new SearchResult { ActionName = actionName, RouteValues = routeValues };

            return searchResult;
        }


        private bool IsSearchCompleteMatch( MatchCollection tagMatches, MatchCollection locationMatches, out string q )
        {
            var tagMatchesCompareString = ((IEnumerable)tagMatches).ToFormattedStringList("{0} ");
            var locationMatchesCompareString = ((IEnumerable)locationMatches).ToFormattedStringList("{0} ");
            var combinedCompareString = (tagMatchesCompareString + locationMatchesCompareString).Trim();

            bool match = string.Compare( UserInputSearchString.ToAlphabetical(), combinedCompareString.ToAlphabetical(), true ) == 0;
            q = string.Empty;

            if (!match)
	        {
                IEnumerable<string> difference = (UserInputSearchString.ToLower().Split( ' ' )).Except( combinedCompareString.ToLower().Split( ' ' ) );
                q = difference.FriendlyUrlEncode(); 
	        }

            return match;
        }
    }
}
