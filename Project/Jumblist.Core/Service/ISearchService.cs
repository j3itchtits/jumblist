using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public interface ISearchService
    {
        string TagSearch { get; set; }
        //string LocationSearch { get; set; }
        string PostCategorySearch { get; set; }
        string[] Tags { get; set; }
        //string[] Locations { get; set; }

        SearchResult ProcessSearch();
    }
}