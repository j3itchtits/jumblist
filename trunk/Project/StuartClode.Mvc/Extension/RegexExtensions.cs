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
        public static bool IsPhraseMatch(string input, string pattern, RegexOptions options)
        {
            bool isMatch = false;

            isMatch = Regex.IsMatch(input, @"\b" + pattern + @"\b", options);

            if (!isMatch)
            {
                string newPattern = Regex.Replace(pattern, @"\s", "-");
                isMatch = Regex.IsMatch(input, @"\b" + newPattern + @"\b", options);
            }

            if (!isMatch)
            {
                string newPattern = Regex.Replace(pattern, @"\s", string.Empty);
                isMatch = Regex.IsMatch(input, @"\b" + newPattern + @"\b", options);
            }

            return isMatch;
        }

        public static bool IsSingularOrPluralPhraseMatch(string input, string pattern, RegexOptions options)
        {
            bool isMatch = false;

            isMatch = IsPhraseMatch(input, pattern, options);

            if (!isMatch)
            {
                string newPattern = pattern + "(s|es)";
                isMatch = IsPhraseMatch(input, newPattern, options);
            }

            if (!isMatch && pattern.EndsWith("y", StringComparison.OrdinalIgnoreCase))
            {
                string newPattern = Regex.Replace(pattern, @"y$", "ies");
                isMatch = IsPhraseMatch(input, newPattern, options);
            }

            if (!isMatch && pattern.EndsWith( "fe", StringComparison.OrdinalIgnoreCase ))
            {
                string newPattern = Regex.Replace( pattern, @"fe$", "ves" );
                isMatch = IsPhraseMatch( input, newPattern, options );
            }

            return isMatch;
        }
    }
}
