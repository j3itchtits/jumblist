using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using System.Text;
using StuartClode.Mvc.Service.Encryption;
using StuartClode.Mvc.Service.Randomize;
using System.Globalization;
using System.Threading;

namespace StuartClode.Mvc.Extension
{
    public static class StringExtensions
    {
        public const string FieldSeparator = " > ";

        public const string UrlRegex = @"((https?|ftp|gopher|telnet|file|notes|ms-help):((//)|(\\\\))+[\w\d:#@%/;$()~_?\+-=\\\.&]*)";
        //public const string UKPostcodeOnlyRegex = @"^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$";
        //public const string UKPostcodeOnlyRegex = @"^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z])))) {0,1}[0-9][A-Za-z]{2})$";
        //public const string UKPostcodeGov = @"^(GIR 0AA)|((([A-Z-[QVX]][0-9][0-9]?)|(([A-Z-[QVX]][A-Z-[IJZ]][0-9][0-9]?)|(([A-Z-[QVX]][0-9][A-HJKSTUW])|([A-Z-[QVX]][A-Z-[IJZ]][0-9][ABEHMNPRVWXY])))) [0-9][A-Z-[CIKMOV]]{2})$";
        //public const string UKPostcodeOnlyRegex = @"^[A-Z]{1,2}[0-9R][0-9A-Z]? [0-9][A-Z-[CIKMOV]]{2}$";
        
        public const string UKPostcodeOnlyRegex = @"^[A-Z]{1,2}[0-9R][0-9A-Z]?(\s|)[0-9][A-Z]{2}$";
        public const string UKPostcodeOnlyRegexCaseInsensitive = @"^[A-Za-z]{1,2}[0-9R][0-9A-Za-z]?(\s|)[0-9][A-Za-z]{2}$"; 
        public const string UKPostcodeDistrictOnlyRegex = @"^[A-Z]{1,2}[0-9]{1,2}$";
        public const string UKPostcodeRegex = @"\b[A-Z]{1,2}[0-9R][0-9A-Z]?(\s|)[0-9][A-Z-[CIKMOV]]{2}\b";
        public const string UKPostcodeDistrictRegex = @"\b[A-Z]{1,2}[0-9]{1,2}\b";
        
        public const string EmailOnlyRegex = @"^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$";
        public const string PasswordOnlyRegex = @"^[^\s]{6,50}$";

        public static string ToFriendlyUrlEncode( this string helper )
        {
            helper = (helper ?? "").Trim().ToLower();
            helper = Regex.Replace( helper, @", ", "+" );        // a comma then space becomes a separator (+) in the url
            helper = Regex.Replace( helper, @"[^a-z0-9+]", "-" ); // invalid chars become a connector (-) in the url
            helper = Regex.Replace( helper, @"-+", "-" ); // convert multiple dashes into one
            return helper;
        }

        public static string[] ToFriendlyUrlDecode( this string helper )
        {
            return (helper ?? string.Empty).Split( '+' );
        }

        public static string ToFriendlyQueryStringEncode( this string helper )
        {
            helper = (helper ?? "").Trim().ToLower();
            helper = Regex.Replace( helper, @", ", " " );        // a comma then space becomes a space (+) in the querystring
            helper = Regex.Replace( helper, @"[^a-z0-9\s+]", "-" ); // invalid chars become a connector (-) in the querystring
            helper = Regex.Replace( helper, @"-+", "-" ); // convert multiple dashes into one
            return helper;
        }

        public static string[] ToFriendlyQueryStringDecode( this string helper )
        {
            //return (helper ?? string.Empty).Split( ' ' );
            return (helper == null) ? null : helper.Split( ' ' );
        }

        public static string ToCleanSearchString( this string helper )
        {
            helper = (helper ?? string.Empty).Trim();
            helper = Regex.Replace( helper, @",", " " );        
            helper = Regex.Replace( helper, @"[^A-Za-z0-9\s]", "" ); //remove punctuation 
            helper = Regex.Replace( helper, @"\sand\s", " " ); 
            helper = Regex.Replace( helper, @"\sor\s", " " );
            helper = Regex.Replace( helper, @"\s+", " " ); // convert multiple spaces into one
            return helper;
        }

        public static string ToAlphabetical( this string input )
        {
            return input.Split( ' ' ).OrderBy( s => s ).ToFormattedStringList( "{0} ", 1 );
        }

        public static string ToShortDescription( this string input )
        {
            if (string.IsNullOrEmpty( input ) ) return string.Empty;

            string ret = (input.Length < 150) ? input : input.Substring( 0, 150 ) + "...";

            return ReplaceLineBreaks( ret, " " );
        }

        public static string ToShortDescription( this string input, int chars )
        {
            if ( string.IsNullOrEmpty( input ) ) return string.Empty;

            string ret = (input.Length < chars) ? input : input.Substring( 0, chars ) + "...";

            return ReplaceLineBreaks( ret, " " );
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

        public static string ReplaceParagraphBreaksWithHtmlBrTags( this string lines )
        {
            return lines.Replace( "\r\n", "<br/>" ).Replace( "\n", "<br/>" );
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
            string[] searchArray = search.Split( ' ' );
            string ret = (searchArray.Where( s => s.Length > 0 )).ToFormattedStringList( "(^{0}$)|", 1 );
            if (ret.Length == 0) ret = "(?!)";
            return ret;

            // We probably don't need this (FindAllWordPhraseCombinations) as each tag is NOW ONLY ONE word rather than a word or phrase
            //string[] searchArray = FindAllWordPhraseCombinations( search.Split( ' ' ) );
            //return (searchArray.Where( s => s.Length > 0 )).ToFormattedStringList( "(^{0}$)|", 1 );
        }

        public static string RemoveRight( this string result, int rightLengthToRemove )
        {
            return (result.Length == 0) ? string.Empty : result.Remove( result.Length - rightLengthToRemove );
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

        public static string EncryptString( this string input )
        {
            if ( input == null ) return string.Empty;

            ISettingsProvider _settings = new SettingsProvider();
            //string salt = GetAntiForgeryToken( _settings.SaltGeneratorKey );
            string salt = "a90sf7oj";

            IEncryptString _encrypter = new RijndaelStringEncrypter( _settings, salt ); 
            var encryptedValue = _encrypter.Encrypt( input );
            _encrypter.Dispose();

            return encryptedValue;
        }

        public static string DecryptString( this string input )
        {
            if ( input == null ) return string.Empty;

            ISettingsProvider _settings = new SettingsProvider();
            //string salt = GetAntiForgeryToken( _settings.SaltGeneratorKey );
            string salt = "a90sf7oj";

            IEncryptString _encrypter = new RijndaelStringEncrypter( _settings, salt ); 
            var decryptedValue = _encrypter.Decrypt( input );
            _encrypter.Dispose();

            return decryptedValue;
        }


        /// <summary>
        /// An Extension Method to allow us t odo "The Title Of It".asTitleCase()
        /// which would return a TitleCased string.
        /// </summary>
        /// <param name="title">Title to work with.</param>
        /// <returns>Output title as TitleCase</returns>
        public static string ToTitleCase( this string title )
        {
            if ( string.IsNullOrEmpty( title ) ) return string.Empty;
            
            char[] space = new char[] { ' ' };

            List<string> artsAndPreps = new List<string>() { "a", "an", "and", "any", "at", "from", "into", "of", "on", "or", "some", "the", "to", };

            //Get the culture property of the thread.
            CultureInfo cultureInfo = Thread.CurrentThread.CurrentCulture;
            //Create TextInfo object.
            TextInfo textInfo = cultureInfo.TextInfo;

            //Convert to title case.
            title = textInfo.ToTitleCase( title.ToLower() );

            List<string> tokens = title.Split( space, StringSplitOptions.RemoveEmptyEntries ).ToList();

            title = tokens[0];

            tokens.RemoveAt( 0 );

            title += tokens.Aggregate<String, String>( String.Empty, ( String prev, String input )
                                    => prev +
                                        (artsAndPreps.Contains( input.ToLower() ) // If True
                                            ? " " + input.ToLower()              // Return the prep/art lowercase
                                            : " " + input) );                   // Otherwise return the valid word.

            // Handle an "Out Of" but not in the start of the sentance
            title = Regex.Replace( title, @"(?!^Out)(Out\s+Of)", "out of" );

            return title;

        }
        //public static string GetAntiForgeryToken( string salt )
        //{
        //    var input = _helper.AntiForgeryToken( salt ).ToString();
        //    var match = _valueExtractorRegex.Match( input );
        //    return match.Groups[1].Value;
        //}
    }
}