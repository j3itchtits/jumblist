using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Jumblist.Website.Extension
{
    public static class ImageHelperExtensions
    {
        public static MvcHtmlString Image( this HtmlHelper htmlHelper, string imgSrc, string altText )
        {
            return Image( htmlHelper, imgSrc, altText, null );
        }

        public static MvcHtmlString Image( this HtmlHelper htmlHelper, string imgSrc, string altText, object htmlAttributes )
        {
            // Create tag builder
            var builder = new TagBuilder( "img" );

            // Add attributes
            builder.MergeAttribute( "src", imgSrc );
            builder.MergeAttribute( "alt", altText );
            builder.MergeAttributes( new RouteValueDictionary( htmlAttributes ), true );

            // Render tag
            return MvcHtmlString.Create( builder.ToString( TagRenderMode.SelfClosing ) );
        }

    }
}
