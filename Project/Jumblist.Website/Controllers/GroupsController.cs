using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Core.Service.Data;
using StuartClode.Mvc.Service;
using xVal.ServerSide;
using StuartClode.Mvc.Extension;
using Jumblist.Website.Filter;

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
            var list = feedService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Groups";

            return View( model );
        }
    }
}
