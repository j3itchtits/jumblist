using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace Jumblist.Website.Extension
{
    public static class AjaxHelperExtensions
    {
        public static MvcHtmlString EmailPostLink( this AjaxHelper helper, string linkText, object routeValues, AjaxOptions ajaxOptions )
        {
            if ( HttpContext.Current.Request.IsAuthenticated )
                return helper.ActionLink( linkText, "email", routeValues, ajaxOptions );
            else
                return MvcHtmlString.Create( string.Empty );
        }

        public static MvcHtmlString SavePostToBasketLink( this AjaxHelper helper, string linkText, object routeValues, AjaxOptions ajaxOptions )
        {
            if ( HttpContext.Current.Request.IsAuthenticated )
                return helper.ActionLink( linkText, "additem", "basket", routeValues, ajaxOptions );
            else
                return MvcHtmlString.Create( string.Empty );
        }
    }
}
