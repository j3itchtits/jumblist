using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace StuartClode.Mvc.Extension
{
    public static class RegexExtensions
    {
        public static bool IsWordMatch(string input, string pattern, RegexOptions options)
        {
            return Regex.IsMatch(input, @"\b" + pattern + @"\b", options);
        }

        public static bool IsSingularOrPluralWordMatch(string input, string pattern, RegexOptions options)
        {
            return Regex.IsMatch(input, @"\b" + pattern + @"(\b|s\b|es\b)", options);
        }
    }
}
