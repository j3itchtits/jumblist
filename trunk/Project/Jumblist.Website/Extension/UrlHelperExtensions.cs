using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using StuartClode.Mvc.Extension;

namespace Jumblist.Website.Extension
{
    public static class UrlHelperExtensions
    {
        public static string Image( this UrlHelper urlHelper, string fileName )
        {
            return urlHelper.Content( string.Format( "~/assets/images/{0}", fileName.ToLower() ) );
        }

        public static string Image( this UrlHelper urlHelper, string fileName, string area )
        {
            return urlHelper.Content( string.Format( "~/areas/{0}/assets/images/{1}", area, fileName.ToLower() ) );
        }

        public static string Stylesheet( this UrlHelper urlHelper, string fileName )
        {
            return urlHelper.Content( string.Format( "~/assets/stylesheets/{0}", fileName.ToLower() ) );
        }

        public static string ImportedAsset( this UrlHelper urlHelper, string project, string fileName )
        {
            return urlHelper.Content( string.Format( "~/assets/{0}/{1}", project.ToLower(), fileName.ToLower() ) );
        }

        public static string Stylesheet( this UrlHelper urlHelper, string fileName, string area )
        {
            return urlHelper.Content( string.Format( "~/areas/{0}/assets/stylesheets/{1}", area, fileName.ToLower() ) );
        }

        public static string Script( this UrlHelper urlHelper, string fileName )
        {
            return urlHelper.Content( string.Format( "~/assets/scripts/{0}", fileName.ToLower() ) );
        }

        public static string Script( this UrlHelper urlHelper, string fileName, string area )
        {
            return urlHelper.Content( string.Format( "~/areas/{0}/assets/scripts/{1}", area, fileName.ToLower() ) );
        }

        public static string PostUrl( this UrlHelper urlHelper, int postId, string postTitle )
        {
            return urlHelper.Content( string.Format( "~/post/{0}/{1}", postId, postTitle.ToFriendlyUrlEncode() ) );
        }

    }
}
