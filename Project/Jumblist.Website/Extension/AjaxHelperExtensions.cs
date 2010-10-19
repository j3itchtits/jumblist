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
        public static MvcHtmlString ImageLink( this AjaxHelper ajaxHelper, string imageUrl, string altText, string actionName, string controllerName, object routeValues, AjaxOptions ajaxOptions, object htmlAttributes )
        {
            TagBuilder imageTag = new TagBuilder( "img" );
            imageTag.MergeAttribute( "src", imageUrl );
            imageTag.MergeAttribute( "alt", altText );
            string image = imageTag.ToString( TagRenderMode.SelfClosing );

            //TagBuilder anchorTag = new TagBuilder( "a" );
            //anchorTag.MergeAttribute( "href", urlHelper.Action( actionName, controllerName, routeValues ) );
            //anchorTag.InnerHtml = image;
            //anchorTag.MergeAttributes( new RouteValueDictionary( anchorHtmlAttributes ), true );
            //string anchor = anchorTag.ToString();

            string anchor = ajaxHelper.ActionLink( "[replaceme]", actionName, controllerName, routeValues, ajaxOptions, htmlAttributes ).ToString();

            return MvcHtmlString.Create( anchor.Replace( "[replaceme]", image ) );
        }

        //public static MvcHtmlString EmailPostImageLink( this AjaxHelper ajaxHelper, string altText, object routeValues, object htmlAttributes )
        //{
        //    //HtmlHelper htmlHelper = new HtmlHelper( ajaxHelper.ViewContext, ); ;

        //    //if ( string.IsNullOrEmpty( linkText ) ) linkText = "<img src='assets/images/email-icon.png' width='25' height='25' alt='Email' />";

        //    string imgSrc = "/assets/images/email-icon.png";

        //    if ( HttpContext.Current.Request.IsAuthenticated )
        //    {
        //        return ImageLink( ajaxHelper, imgSrc, altText, "Email", "Posts", routeValues, new AjaxOptions { Confirm = "Send Email?", HttpMethod = "Post", UpdateTargetId = "system-message" }, htmlAttributes );
        //        //return ajaxHelper.ActionLink( linkText, "email", routeValues, new AjaxOptions { Confirm = "Send Email?", HttpMethod = "Post", UpdateTargetId = "system-message" }, htmlAttributes );
        //    }
        //    else
        //    {
        //        RouteValueDictionary newValues = new RouteValueDictionary( routeValues );
        //        return MvcHtmlString.Create( "<a class='launchSendEmailLink' onclick=\"setEmail( " + newValues["id"] + ", '" + newValues["title"] + "' );\" href='#' title='" + altText + "'><img src='" + imgSrc + "' width='25' height='25' alt='" + altText + "' /></a>" );
        //        //return MvcHtmlString.Create( "<a class='icon launchSendEmailLink' onclick=\"setEmail( 5000, 'Some kind of title' );\" href='/users/login?returnurl=" + HttpContext.Current.Request.Url.PathAndQuery + "' title='" + linkText + "'>" + linkText + "</a>" );


        //        //return MvcHtmlString.Create( "<a href='/users/login?returnurl='" + ajaxHelper.ViewContext.RouteData.Values["returnUrl"].ToString() + ">Email</a>" );
        //        //return MvcHtmlString.Create( UrlHelper.GenerateUrl( null, "login", "users", new RouteValueDictionary( routeValues ), ajaxHelper.RouteCollection, ajaxHelper.ViewContext.RequestContext, true ) );

        //        //this will not work as we do not want an ajax ajaxHelper to be retured in this instance - probably needs to be sorted out at some point
        //        //return ajaxHelper.ActionLink( linkText, "login", "users", new { returnUrl = HttpContext.Current.Request.Url.PathAndQuery }, null, htmlAttributes );
        //        //return MvcHtmlString.Create( "<a class='icon' href='/users/login?returnurl=" + HttpContext.Current.Request.Url.PathAndQuery + "' title='" + linkText + "'>" + linkText + "</a>" );
        //    }
        //    //return ajaxHelper.ActionLink( linkText, "email", routeValues, ajaxOptions );
        //}

        //public static MvcHtmlString EmailPostLink( this AjaxHelper ajaxHelper, string linkText, object routeValues, object htmlAttributes )
        //{
        //    if ( HttpContext.Current.Request.IsAuthenticated )
        //    {
        //        return ajaxHelper.ActionLink( linkText, "Email", routeValues, new AjaxOptions { Confirm = "Send Email?", HttpMethod = "Post", UpdateTargetId = "system-message" }, htmlAttributes );
        //    }
        //    else
        //    {
        //        RouteValueDictionary newValues = new RouteValueDictionary( routeValues );
        //        return MvcHtmlString.Create( "<a class='icon launchSendEmailLink' onclick=\"setEmail( " + newValues["id"] + ", '" + newValues["title"] + "' );\" href='#' title='" + linkText + "'>" + linkText + "</a>" );
        //    }
        //}

        public static MvcHtmlString SavePostToBasketImageLink( this AjaxHelper ajaxHelper, string altText, object routeValues, object htmlAttributes )
        {
            string imgSrc = "/assets/images/save-icon.png";

            if ( HttpContext.Current.Request.IsAuthenticated )
            {
                return ImageLink( ajaxHelper, imgSrc, altText, "AddItem", "Basket", routeValues, new AjaxOptions { Confirm = "Add Post to Basket?", HttpMethod = "Post", UpdateTargetId = "basket" }, htmlAttributes );
            }
            else
            {
                return MvcHtmlString.Create( "<a href='/users/login?returnurl=" + HttpContext.Current.Request.Url.PathAndQuery + "' title='" + altText + "'><img src='" + imgSrc + "' width='25' height='25' alt='" + altText + "' /></a>" );
            }
        }

        public static MvcHtmlString SavePostToBasketLink( this AjaxHelper ajaxHelper, string linkText, object routeValues, object htmlAttributes )
        {
            if ( HttpContext.Current.Request.IsAuthenticated )
            {
                return ajaxHelper.ActionLink( linkText, "AddItem", "Basket", routeValues, new AjaxOptions { Confirm = "Add Post to Basket?", HttpMethod = "Post", UpdateTargetId = "basket" }, htmlAttributes );
            }
            else
            {
                return MvcHtmlString.Create( "<a class='icon' href='/users/login?returnurl=" + HttpContext.Current.Request.Url.PathAndQuery + "' title='" + linkText + "'>" + linkText + "</a>" );
            }
        }
    }
}
