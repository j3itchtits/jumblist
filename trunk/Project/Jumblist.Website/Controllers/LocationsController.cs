using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Core.Service;
using xVal.ServerSide;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Extension;
using Jumblist.Website.ViewModel;

namespace Jumblist.Website.Controllers
{
    public class LocationsController : ViewModelController<Location>
    {
        private readonly ILocationService locationService;

        public LocationsController( ILocationService locationService )
        {
            this.locationService = locationService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Index()
        {
            var list = locationService.SelectRecordList().OrderBy(x => x.Name);

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Locations";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ContentResult AjaxFindLocationNames( string q )
        {
            var locations = locationService.SelectLocationNameList( q );

            return Content( locations.ToNewLineDelimitedString() );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ContentResult AjaxFindLocationNameAndAreas( string q )
        {
            var locations = locationService.SelectLocationNameAndAreaList( q );

            return Content( locations.ToNewLineDelimitedString() );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ContentResult AjaxFindLocationAreas( string q )
        {
            var locations = locationService.SelectLocationAreaList( q );

            return Content( locations.ToNewLineDelimitedString() );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ContentResult AjaxLocations()
        {
            var locations = locationService.SelectLocationNameTownList();

            //return raw text, one result on each line
            return Content( locations.ToNewLineDelimitedString() );
        } 
    }
}
