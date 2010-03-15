using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StuartClode.Mvc.Extension;
using Jumblist.Core.Service.Data;
using System.Text.RegularExpressions;
using System.Collections;

namespace Jumblist.Core.Service
{
    public class SearchService : ISearchService
    {
        private readonly ILocationService locationService;
        private readonly ITagService tagService;
        private string userInputSearch;

        public SearchService(ILocationService locationService, ITagService tagService)
        {
            this.locationService = locationService;
            this.tagService = tagService;
        }

        public string UserInputSearch 
        {
            get { return userInputSearch; }
            set { userInputSearch = value.ToCleanSearchString(); } 
        }

        public string Tags { get; set; }
        public string Locations { get; set; }

        public string TagQueryString { get; set; }
        public string LocationQueryString { get; set; }
        public bool IsCompleteSearchMatch { get; set; }
        public string SearchResult { get; set; }

        public void ProcessSearch()
        {
            var searchPattern = UserInputSearch.ToSearchRegexPattern();

            var tagMatches = Regex.Matches(Tags, searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline);
            var locationMatches = Regex.Matches(Locations, searchPattern, RegexOptions.IgnoreCase | RegexOptions.Multiline);

            TagQueryString = (tagMatches.Count > 0) ? ((IEnumerable)tagMatches).ToFormattedStringList("{0}, ", 2).ToFriendlyUrl() : string.Empty;
            LocationQueryString = (locationMatches.Count > 0) ? ((IEnumerable)locationMatches).ToFormattedStringList("{0}, ", 2).ToFriendlyUrl() : string.Empty;

            IsCompleteSearchMatch = IsSearchCompleteMatch(tagMatches, locationMatches);

            SearchResult = WorkOutSearchResult();
        }

        private string WorkOutSearchResult()
        {
            if (IsCompleteSearchMatch)
            {
                if (TagQueryString.Length > 0 && LocationQueryString.Length == 0)
                {
                    return "tagged";
                }

                if (TagQueryString.Length == 0 && LocationQueryString.Length > 0)
                {
                    return "located";
                }

                if (TagQueryString.Length > 0 && LocationQueryString.Length > 0)
                {
                    return "search";
                }
            }
            else
            {
                return "mixed";
            }

            return "problem";
        }

        private bool IsSearchCompleteMatch(MatchCollection tagMatches, MatchCollection locationMatches)
        {
            var tagMatchesCompareString = ((IEnumerable)tagMatches).ToFormattedStringList("{0} ");
            var locationMatchesCompareString = ((IEnumerable)locationMatches).ToFormattedStringList("{0} ");
            var compareString = (tagMatchesCompareString + locationMatchesCompareString).Trim();

            return string.Compare(UserInputSearch.ToAlphabetical(), compareString.ToAlphabetical(), true) == 0;
        }
    }
}
