using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JumblistTest.Core.Service;
using System.Web.Mvc;

namespace JumblistTest.Website.Filter
{
    public class LoadFeedsAttribute : ActionFilterAttribute
    {
        public IFeedService FeedService { get; set; }

        public override void OnActionExecuting( ActionExecutingContext filterContext )
        {
            filterContext.Controller.ViewData["feeds"] = FeedService.SelectList();
            base.OnActionExecuting( filterContext );
        }
    }
}
