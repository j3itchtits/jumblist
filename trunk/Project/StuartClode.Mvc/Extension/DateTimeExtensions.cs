using System;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StuartClode.Mvc.Model;

namespace StuartClode.Mvc.Extension
{
    public static class DateTimeExtensions
    {
        public static string ToDateTimeDiff( this DateTime from, DateTime to, bool onlyRecent )
        {
            return to.Subtract( from ).ToDateTimeDiff( from, onlyRecent );
        }

        public static string ToFriendlyJumblistLongDateTimeString( this DateTime dateTime, bool onlyRecent )
        {
            return dateTime.ToDateTimeDiff( DateTime.Now, onlyRecent ) + " " + dateTime.ToString( "dddd, dd MMMM yyyy" ) + " at " + dateTime.ToString( "h:mm tt" ) + ". ";
        }

        public static string ToFriendlyJumblistShortDateTimeString( this DateTime dateTime, bool onlyRecent )
        {
            return dateTime.ToDateTimeDiff( DateTime.Now, onlyRecent ) + " " + dateTime.ToString( "dd MMMM yyyy" ) + ". ";
        }

        public static string ToFriendlyJumblistAlternateShortDateTimeString( this DateTime dateTime )
        {
            return DateTime.Now.Subtract( dateTime ).ToDateTimeDiff( dateTime, false );
        }
    }
}
