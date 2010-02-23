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
        public const string Url = @"((https?|ftp|gopher|telnet|file|notes|ms-help):((//)|(\\\\))+[\w\d:#@%/;$()~_?\+-=\\\.&]*)";
        //public const string UKPostcode = @"^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$";
        public const string UKPostcode = @"^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z])))) {0,1}[0-9][A-Za-z]{2})$";
        public const string UKPostcodeBasic = @"^[A-Z]{1,2}[0-9]{1,2}$";
        public const string Email = @"^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$";
        public const string Password = @"^[^\s]{6,50}$";

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
