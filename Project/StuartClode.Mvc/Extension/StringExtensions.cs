using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using System.Text;

namespace StuartClode.Mvc.Extension
{
    public static class StringExtensions
    {
        public const string FieldSeparator = " > ";
        public const string Url = @"((https?|ftp|gopher|telnet|file|notes|ms-help):((//)|(\\\\))+[\w\d:#@%/;$()~_?\+-=\\\.&]*)";
        //public const string UKPostcode = @"^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$";
        public const string UKPostcode = @"^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z])))) {0,1}[0-9][A-Za-z]{2})$";
        public const string UKPostcodeBasic = @"^[A-Z]{1,2}[0-9]{1,2}$";
        public const string Email = @"^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$";
        public const string Password = @"^[^\s]{6,50}$";


        public static string ToFriendlyUrlEncode( this string helper )
        {
            helper = (helper ?? "").Trim().ToLower();
            helper = Regex.Replace( helper, @", ", "+" );        // a comma then space becomes a separator (+) in the url
            helper = Regex.Replace( helper, @"[^a-z0-9+]", "-" ); // invalid chars become a connector (-) in the url
            helper = Regex.Replace( helper, @"-+", "-" ); // convert multiple dashes into one
            return helper;
        }

        public static string[] ToFriendlyUrlDecode(this string helper)
        {
            return helper.Split('+'); ;
        }

        public static string ToCleanSearchString( this string helper )
        {
            helper = (helper ?? "").Trim().ToLower();
            helper = Regex.Replace( helper, @",", " " );        
            helper = Regex.Replace( helper, @"[^a-z0-9\s]", "" ); //remove punctuation 
            helper = Regex.Replace( helper, @"\sand\s", " " ); 
            helper = Regex.Replace( helper, @"\sor\s", " " );
            helper = Regex.Replace( helper, @"\s+", " " ); // convert multiple spaces into one
            return helper;
        }

        public static string ToAlphabetical( this string input )
        {
            return input.Split( ' ' ).OrderBy( s => s ).ToFormattedStringList( "{0} ", 1 );
        }

        public static string AlterIfNotNullOrEmpty(this string input, string prepend, string postpend)
        {
            if (!string.IsNullOrEmpty(input))
            {
                if (!string.IsNullOrEmpty(prepend)) input = prepend + input;
                if (!string.IsNullOrEmpty(postpend)) input = input + postpend;
            }
            else
            {
                input = string.Empty;
            }

            return input;
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

        public static bool IsPhraseRegexMatch( this string input, string pattern, RegexOptions options )
        {
            bool isMatch = false;

            isMatch = Regex.IsMatch( input, @"\b" + pattern + @"\b", options );

            if (!isMatch)
            {
                string newPattern = Regex.Replace( pattern, @"\s", "-" );
                isMatch = Regex.IsMatch( input, @"\b" + newPattern + @"\b", options );
            }

            if (!isMatch)
            {
                string newPattern = Regex.Replace( pattern, @"\s", string.Empty );
                isMatch = Regex.IsMatch( input, @"\b" + newPattern + @"\b", options );
            }

            return isMatch;
        }

        public static bool IsSingularOrPluralPhraseRegexMatch( this string input, string pattern, RegexOptions options )
        {
            bool isMatch = false;

            isMatch = IsPhraseRegexMatch( input, pattern, options );

            if (!isMatch)
            {
                string newPattern = pattern + "(s|es)";
                isMatch = IsPhraseRegexMatch( input, newPattern, options );
            }

            if (!isMatch && pattern.EndsWith( "y", StringComparison.OrdinalIgnoreCase ))
            {
                string newPattern = Regex.Replace( pattern, @"y$", "ies" );
                isMatch = IsPhraseRegexMatch( input, newPattern, options );
            }

            if (!isMatch && pattern.EndsWith( "fe", StringComparison.OrdinalIgnoreCase ))
            {
                string newPattern = Regex.Replace( pattern, @"fe$", "ves" );
                isMatch = IsPhraseRegexMatch( input, newPattern, options );
            }

            return isMatch;
        }

        public static string ToSearchRegexPattern( this string search )
        {
            //string[] searchArray = search.Split( ' ' );
            //return (searchArray.Where( s => s.Length > 0 )).ToFormattedStringList( "(^{0}$)|", 1 );

            string[] searchArray = FindAllWordPhraseCombinations( search.Split( ' ' ) );
            return (searchArray.Where( s => s.Length > 0 )).ToFormattedStringList( "(^{0}$)|", 1 );
        }

        private static string[] FindAllWordPhraseCombinations( params string[] args )
        {
            //if (args.Count() == 0)
            //{
            //    return new string[] { "" };
            //}
            //else
            //{
            //    string[] temp = FindWords( args.Skip( 1 ).ToArray() );
            //    return temp.Union( temp.Select( s => (args[0] + " " + s).Trim() ) ).ToArray();
            //}

            if (args.Count() == 0)
            {
                return new String[] { "" };
            }
            else
            {
                String[] oldWords = FindAllWordPhraseCombinations( args.Skip( 1 ).ToArray() );
                String[] newWords = oldWords.Where( word => word == "" || word.Split( new String[] { " " }, StringSplitOptions.RemoveEmptyEntries )[0] == args[1] )
                    .Select( word => (args[0] + " " + word).Trim() )
                    .ToArray();

                return oldWords.Union( newWords ).ToArray();
            }

        }
    }
}