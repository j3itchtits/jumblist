using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Data.Access;
using Jumblist.Website.Helpers;
using Jumblist.Data.Model;
using Jumblist.Website.Services.Paging;

namespace Jumblist.Website.Controllers
{
    public class FeedsController : Controller
    {

        private int pageSize = 5;
        private IFeedRepository feedRepository;

        public FeedsController( IFeedRepository feedRepository )
        {
            this.feedRepository = feedRepository;
        }

        public int PageSize
        {
            get { return pageSize; }
            set { pageSize = value; }
        }

        //
        // GET: /Locations/List/[parameter1]

        public ViewResult List( int? parameter1 )
        {
            var feedList = feedRepository.Feeds;

            var pagedFeedList = new PaginatedList<Feed>( feedList.ToList(), ( parameter1 ?? 1 ), PageSize );

            return View( "List", pagedFeedList );
        }

    }
}
