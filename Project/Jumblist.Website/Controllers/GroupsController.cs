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

        public GroupsController( IFeedService feedService )
        {
            this.feedService = feedService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Index()
        {
            IEnumerable<Feed> list = feedService.SelectRecordList().OrderBy( x => x.Name );
            //IEnumerable<Feed> list = cacheService.Get( "feed.list", () => feedService.SelectRecordList().OrderBy( x => x.Name ) );

            DefaultViewModel<Feed> model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Groups";

            return View( model );
        }
    }
}
