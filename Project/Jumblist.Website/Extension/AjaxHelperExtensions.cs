using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Routing;
using StuartClode.Mvc.Extension;

namespace Jumblist.Website.Extension
{
    public static class AjaxHelperExtensions
    {
        public static MvcHtmlString EmailPostLink( this AjaxHelper helper, string linkText, object routeValues )
        {
            if ( HttpContext.Current.Request.IsAuthenticated )
                return helper.ActionLink( linkText, "email", routeValues, new AjaxOptions { Confirm = "Send?", HttpMethod = "Post", UpdateTargetId = "messages" } );
            else
                //return MvcHtmlString.Create( "<a href='/users/login?returnurl='" + helper.ViewContext.RouteData.Values["returnUrl"].ToString() + ">Email</a>" );
                //return MvcHtmlString.Create( UrlHelper.GenerateUrl( null, "login", "users", new RouteValueDictionary( routeValues ), helper.RouteCollection, helper.ViewContext.RequestContext, true ) );
                return MvcHtmlString.Create( "<a href='/users/login?returnurl=" + HttpContext.Current.Request.Url.PathAndQuery + "'>Email</a>" );

            //return helper.ActionLink( linkText, "email", routeValues, ajaxOptions );
        }

        public static MvcHtmlString SavePostToBasketLink( this AjaxHelper helper, string linkText, object routeValues )
        {
            if ( HttpContext.Current.Request.IsAuthenticated )
                return helper.ActionLink( linkText, "additem", "basket", routeValues, new AjaxOptions { Confirm = "Save?", HttpMethod = "Post", UpdateTargetId = "basket-widget" } );
            else
                //return MvcHtmlString.Create( "<a href='/users/login?returnurl='" + helper.ViewContext.RouteData.Values["returnUrl"].ToString() + ">Save</a>" );
                //return MvcHtmlString.Create( UrlHelper.GenerateUrl( null, "login", "users", new RouteValueDictionary( routeValues ), helper.RouteCollection, helper.ViewContext.RequestContext, true ) );
                return MvcHtmlString.Create( "<a href='/users/login?returnurl=" + HttpContext.Current.Request.Url.PathAndQuery + "'>Save</a>" );

            //return helper.ActionLink( linkText, "additem", "basket", routeValues, ajaxOptions );
        }
    }
}
