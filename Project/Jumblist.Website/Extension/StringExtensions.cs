using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace Jumblist.Website.Extension
{
    public static class StringExtensions
    {
        public static string ToFriendlyUrl( this string helper )
        {
            helper = (helper ?? "").Trim().ToLower();
            helper = Regex.Replace( helper, @"[^a-z0-9]", "-" ); // invalid chars
            helper = Regex.Replace( helper, @"-+", "-" ).Trim(); // convert multiple dashes into one
            return helper;
        }


    }
}
