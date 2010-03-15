using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public interface ISearchService
    {
        string UserInputSearchString { get; set; }
        string UserInputSearchOptions { get; set; }
        string[] Tags { get; set; }
        string[] Locations { get; set; }

        SearchResult ProcessSearch();
    }
}