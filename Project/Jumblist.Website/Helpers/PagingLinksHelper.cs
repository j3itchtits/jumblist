﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;

namespace Jumblist.Website.Helpers
{
    public static class PagingLinksHelper
    {
        public static string PagingLinks( this HtmlHelper helper, int currentPage, int totalPages, Func<int, string> pageUrl )
        {
            StringBuilder result = new StringBuilder();
            for ( int i = 1; i <= totalPages; i++ )
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( i ) );
                tag.InnerHtml = i.ToString();
                if ( i == currentPage )
                    tag.AddCssClass( "selected" );
                result.Append( tag.ToString() + " " );
            }
            return result.ToString();
        }
    }
}
