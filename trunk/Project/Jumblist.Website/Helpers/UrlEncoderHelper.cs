using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace Jumblist.Website.Helpers
{
    public static class UrlEncoderHelper
    {
        public static string ToFriendlyUrl( this UrlHelper helper, string urlToEncode )
        {
            return GenerateFriendlyUrl( urlToEncode );
        }

        public static string GenerateFriendlyUrl( string urlToEncode )
        {
            urlToEncode = ( urlToEncode ?? "" ).Trim().ToLower();
            urlToEncode = Regex.Replace( urlToEncode, @"[^a-z0-9]", "-" ); // invalid chars
            urlToEncode = Regex.Replace( urlToEncode, @"-+", "-" ).Trim(); // convert multiple dashes into one
            return urlToEncode;
        } 
    }
}
