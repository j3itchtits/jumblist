using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jumblist.Core.Service;
using System.Web.Mvc;
using Jumblist.Core.Model;

namespace Jumblist.Website.Filter
{
    public class ResetAuthUserSearchDetailsAttribute : ActionFilterAttribute
    {

        public override void OnActionExecuting( ActionExecutingContext filterContext )
        {
            //filterContext.Controller.ViewData["feeds"] = FeedService.SelectRecordList();

            JumblistSession jumblistSession = filterContext.ActionParameters["jumblistSession"] as JumblistSession;
            User user = filterContext.ActionParameters["user"] as User;

            UserSearchArea userSearchArea = jumblistSession.UserSearchArea;

            if ( user.IsAuthenticated && string.IsNullOrEmpty( userSearchArea.LocationName ) )
            {
                userSearchArea.Update( user.Postcode, user.Radius, user.Latitude, user.Longitude );
            }

            base.OnActionExecuting( filterContext );
        }
    }
}
