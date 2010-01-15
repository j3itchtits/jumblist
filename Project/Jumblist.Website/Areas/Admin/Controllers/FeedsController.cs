using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Website.Filter;
using Jumblist.Core.Service;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class FeedsController : ViewModelController<Feed>
    {
        private IFeedService feedService;

        public FeedsController( IFeedService feedService )
        {
            this.feedService = feedService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index()
        {
            return View( "List" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = feedService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Feeds";

            var notification = new Notification();
            notification.RegisterMessage( "This is a message", "message" );
            notification.RegisterMessage( "This is another message", "message" );

            model.Notification = notification;

            return View( model );
        }
    }
}
