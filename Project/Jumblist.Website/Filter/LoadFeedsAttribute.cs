using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jumblist.Core.Service.Data;
using System.Web.Mvc;

namespace Jumblist.Website.Filter
{
    public class LoadFeedsAttribute : ActionFilterAttribute
    {
        public IFeedService FeedService { get; set; }

        public override void OnActionExecuting( ActionExecutingContext filterContext )
        {
            filterContext.Controller.ViewData["feeds"] = FeedService.SelectRecordList();
            base.OnActionExecuting( filterContext );
        }
    }
}
