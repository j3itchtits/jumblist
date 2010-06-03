using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public interface ISearchService
    {
        string TagSearch { get; set; }
        string GroupHidden { get; set; }
        string PostCategorySelection { get; set; }
        string LocationHidden { get; set; }

        SearchResult ProcessSearch();
    }
}