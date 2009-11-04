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
        private int pageSize = 5;
        private ILocationRepository locationRepository;
        private ILocationCategoryRepository locationCategoryRepository;

        public LocationsController( ILocationRepository locationRepository, ILocationCategoryRepository locationCategoryRepository )
        {
            this.locationRepository = locationRepository;
            this.locationCategoryRepository = locationCategoryRepository;
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
            var locationList = locationRepository.Locations;

            var pagedLocationList = new PaginatedList<Location>( locationList, (parameter1 ?? 1), PageSize );

            return View( "List", pagedLocationList );
        }

        //
        // GET: /Locations/Categories

        public ViewResult Categories()
        {
            var locationCategoryList = locationCategoryRepository.LocationCategories;

            return View( "Categories", locationCategoryList );
        }

        //
        // GET: /Locations/Category/[parameter1]

        public ViewResult Category( string parameter1 )
        {
            //var locationList = locationRepository.SelectLocationsByCategory( parameter1 );
            var locationCategory = locationCategoryRepository.SelectLocationCategory( parameter1 );

            return View( "Category", locationCategory );
        }
    }
}
