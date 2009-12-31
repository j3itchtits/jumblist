using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace JumblistTest.Website.Extension
{
    public static class UrlHelperExtensions
    {
        public static string Image( this UrlHelper helper, string fileName )
        {
            return helper.Content( string.Format( "~/assets/images/{0}", fileName.ToLower() ) );
        }

        public static string Stylesheet( this UrlHelper helper, string fileName )
        {
            return helper.Content( string.Format( "~/assets/stylesheets/{0}", fileName.ToLower() ) );
        }

        public static string Script( this UrlHelper helper, string fileName )
        {
            return helper.Content( string.Format( "~/assets/scripts/{0}", fileName.ToLower() ) );
        }
    }
}
