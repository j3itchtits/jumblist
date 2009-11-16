using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jumblist.Website.Helpers
{
    public class PaginatedList<T> : List<T>
    {
        public int CurrentPage { get; private set; }
        public int PageSize { get; private set; }
        public int TotalCount { get; private set; }
        public int TotalPages { get; private set; }

        public PaginatedList( IList<T> source, int currentPage, int pageSize )
        {
            CurrentPage = currentPage;
            PageSize = pageSize;
            TotalCount = source.Count();
            TotalPages = (int)Math.Ceiling(TotalCount / (double)PageSize);
            this.AddRange(source.Skip((CurrentPage - 1) * PageSize).Take(PageSize));
        }

        public bool HasPreviousPage
        {
            get
            {
                return ((CurrentPage - 1) > 0);
            }
        }

        public bool HasNextPage
        {
            get
            {
                return (CurrentPage < TotalPages);
            }
        }
    }
}
