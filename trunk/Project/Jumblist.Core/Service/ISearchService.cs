using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public interface ISearchService
    {
        string UserInputSearch { get; set; }

        void ProcessSearch();
    }
}