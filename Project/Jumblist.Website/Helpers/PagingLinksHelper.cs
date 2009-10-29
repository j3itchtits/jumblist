using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;

namespace Jumblist.Website.Helpers
{
    public static class PagingLinksHtmlHelper
    {
        public static string PagingLinks( this HtmlHelper helper, int currentPage, int totalPages, Func<int, string> pageUrl )
        {
            StringBuilder result = new StringBuilder();
            for ( int i = 1; i <= totalPages; i++ )
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( i ).ToLower() );
                tag.InnerHtml = i.ToString();
                if ( i == currentPage )
                    tag.AddCssClass( "selected" );
                result.Append( tag.ToString() + " " );
            }
            return result.ToString();
        }

        public static string NextPreviousLinks( this HtmlHelper helper, int currentPage, bool hasPreviousPage, bool hasNextPage, Func<int, string> pageUrl )
        {
            string result = string.Empty;

            if (hasPreviousPage)
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( currentPage - 1 ).ToLower() );
                tag.InnerHtml = "<";
                result += tag.ToString() + " ";
            }

            if (hasNextPage)
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( currentPage + 1 ).ToLower() );
                tag.InnerHtml = ">";
                result += tag.ToString() + " ";
            }

            return result;
        }
    }
}
