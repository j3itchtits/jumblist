using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace Jumblist.Website.Extension
{
    public static class UrlHelperExtensions
    {
        public static string Image( this UrlHelper helper, string fileName )
        {
            return helper.Content( string.Format( "~/assets/images/{0}", fileName.ToLower() ) );
        }

        public static string Image( this UrlHelper helper, string fileName, string area )
        {
            return helper.Content( string.Format( "~/areas/{0}/assets/images/{0}", area, fileName.ToLower() ) );
        }

        public static string Stylesheet( this UrlHelper helper, string fileName )
        {
            return helper.Content( string.Format( "~/assets/stylesheets/{0}", fileName.ToLower() ) );
        }

        public static string Stylesheet( this UrlHelper helper, string fileName, string area )
        {
            return helper.Content( string.Format( "~/areas/{0}/assets/stylesheets/{1}", area, fileName.ToLower() ) );
        }

        public static string Script( this UrlHelper helper, string fileName )
        {
            return helper.Content( string.Format( "~/assets/scripts/{0}", fileName.ToLower() ) );
        }

        public static string Script( this UrlHelper helper, string fileName, string area )
        {
            return helper.Content( string.Format( "~/areas/{0}/assets/scripts/{0}", area, fileName.ToLower() ) );
        }
    }
}
