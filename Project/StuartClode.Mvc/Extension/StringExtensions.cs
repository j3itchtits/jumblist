using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace StuartClode.Mvc.Extension
{
    public static class StringExtensions
    {
        public static string ToFriendlyUrl( this string helper )
        {
            helper = (helper ?? "").Trim().ToLower();
            helper = Regex.Replace( helper, @", ", "+" );        // a comma then space becomes a separator (+) in the url
            helper = Regex.Replace( helper, @"[^a-z0-9]", "-" ); // invalid chars become a connector (-) in the url
            helper = Regex.Replace( helper, @"-+", "-" ).Trim(); // convert multiple dashes into one
            return helper;
        }

        public static string ReplaceLineBreaks( this string lines, string replacement )
        {
            return lines.Replace( "\r\n", replacement )
                        .Replace( "\r", replacement )
                        .Replace( "\n", replacement );
        }

        public static string ReplaceParagraphBreaks( this string lines )
        {
            return lines.Replace( "\r\n\r\n", "<br/><br/>" ).Replace( "\n\n", "<br/><br/>" );
        }
    }
}
