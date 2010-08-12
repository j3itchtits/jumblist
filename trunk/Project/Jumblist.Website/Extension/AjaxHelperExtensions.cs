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
        public static MvcHtmlString EmailPostLink( this AjaxHelper helper, string linkText, object routeValues, object htmlAttributes )
        {
            if ( string.IsNullOrEmpty( linkText ) ) linkText = "<img src='assets/images/email-icon.png' width='25' height='25' alt='Email' />";

            if ( HttpContext.Current.Request.IsAuthenticated )
            {
                return helper.ActionLink( linkText, "email", routeValues, new AjaxOptions { Confirm = "Send Email?", HttpMethod = "Post", UpdateTargetId = "system-message" }, htmlAttributes );
            }
            else
            {
                //return MvcHtmlString.Create( "<a href='/users/login?returnurl='" + helper.ViewContext.RouteData.Values["returnUrl"].ToString() + ">Email</a>" );
                //return MvcHtmlString.Create( UrlHelper.GenerateUrl( null, "login", "users", new RouteValueDictionary( routeValues ), helper.RouteCollection, helper.ViewContext.RequestContext, true ) );

                //this will not work as we do not want an ajax helper to be retured in this instance - probably needs to be sorted out at some point
                //return helper.ActionLink( linkText, "login", "users", new { returnUrl = HttpContext.Current.Request.Url.PathAndQuery }, null, htmlAttributes );
                return MvcHtmlString.Create( "<a class='icon' href='/users/login?returnurl=" + HttpContext.Current.Request.Url.PathAndQuery + "'>" + linkText + "</a>" );
            }
            //return helper.ActionLink( linkText, "email", routeValues, ajaxOptions );
        }

        public static MvcHtmlString SavePostToBasketLink( this AjaxHelper helper, string linkText, object routeValues, object htmlAttributes )
        {
            if ( string.IsNullOrEmpty( linkText ) ) linkText = "<img src='assets/images/save-icon.png' width='25' height='25' alt='Save' />";

            if ( HttpContext.Current.Request.IsAuthenticated )
            {
                return helper.ActionLink( linkText, "additem", "basket", routeValues, new AjaxOptions { Confirm = "Save Post to Basket?", HttpMethod = "Post", UpdateTargetId = "basket" }, htmlAttributes );
            }
            else
            {
                //return MvcHtmlString.Create( "<a href='/users/login?returnurl='" + helper.ViewContext.RouteData.Values["returnUrl"].ToString() + ">Save</a>" );
                //return MvcHtmlString.Create( UrlHelper.GenerateUrl( null, "login", "users", new RouteValueDictionary( routeValues ), helper.RouteCollection, helper.ViewContext.RequestContext, true ) );
                return MvcHtmlString.Create( "<a class='icon' href='/users/login?returnurl=" + HttpContext.Current.Request.Url.PathAndQuery + "'>" + linkText + "</a>" );
            }

            //return helper.ActionLink( linkText, "additem", "basket", routeValues, ajaxOptions );
        }
    }
}
