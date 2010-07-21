using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service.Data;
using xVal.ServerSide;
using StuartClode.Mvc.Extension;
using Jumblist.Website.Filter;
using Jumblist.Website.ViewModel;

namespace Jumblist.Website.Controllers
{
    public class GroupsController : ViewModelController<Feed>
    {
        private IFeedService feedService;
        private ICacheService cacheService;

        public GroupsController( IFeedService feedService, ICacheService cacheService )
        {
            this.feedService = feedService;
            this.cacheService = cacheService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Index()
        {
            IQueryable<Feed> list = feedService.SelectRecordList().OrderBy( x => x.Name );
            //IQueryable<Feed> list = cacheService.Get( "feed.lista", () => feedService.SelectRecordList().OrderBy( x => x.Name ) );

            DefaultViewModel<Feed> model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Groups";

            return View( model );
        }
    }
}
