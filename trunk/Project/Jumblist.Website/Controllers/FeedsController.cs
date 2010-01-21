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
    public class FeedsController : ViewModelController<Feed>
    {
        private IFeedService feedService;

        public FeedsController( IFeedService feedService )
        {
            this.feedService = feedService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = feedService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Feeds";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Detail( int id )
        {
            var item = feedService.Select( (id) );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Detail - {0}", item.Title );
            model.Message = new Message { Text = "This is a message", StyleClass = "message" };

            return View( model );
        }
    }
}