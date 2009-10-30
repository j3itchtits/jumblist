using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Model.Interface;
using Jumblist.Website.Helpers;
using Jumblist.Model.Entity;

namespace Jumblist.Website.Controllers
{
    public class LocationsController : Controller
    {
        private int pageSize = 10;
        private ILocationRepository locationRepository;

        public LocationsController( ILocationRepository locationRepository )
        {
            this.locationRepository = locationRepository;
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
            var locationList = locationRepository.SelectLocations();

            var pagedLocationList = new PaginatedList<Location>( locationList, (parameter1 ?? 1), PageSize );

            return View( pagedLocationList );
        }

    }
}
