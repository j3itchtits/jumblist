using System;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StuartClode.Mvc.Model;

namespace StuartClode.Mvc.Extension
{
    public static class TimeSpanExtensions
    {
        public static string ToDateTimeDiff( this TimeSpan t )
        {
            return TimeSpanArticulator.Articulate( t );
        }

        public static string ToDateTimeDiff( this TimeSpan timeSpan, DateTime dateTime )
        {
            double d = 1;
            double days = 5;

            if ( timeSpan.TotalMinutes < d )
            {
                return timeSpan.Seconds.ToString() + " secs ago";
            }
            else if ( timeSpan.TotalHours < d )
            {
                return timeSpan.Minutes.ToString() + " mins ago";
            }
            else if ( timeSpan.TotalDays < d )
            {
                return timeSpan.Hours.ToString() + " hours ago";
            }
            else if ( timeSpan.TotalDays < days )
            {
                return timeSpan.Days.ToString() + " days ago";
            }
            else
            {
                return dateTime.ToString( "MMM dd, yyyy" ) + " at " + dateTime.ToString( "h:mm tt" );
            }
        }

        public static string ToDateTimeDiff( this TimeSpan timeSpan, DateTime dateTime, bool onlyRecent )
        {
            double days = 5;

            if ( onlyRecent && timeSpan.TotalDays >= days )
            {
                return string.Empty;
            }
            else
            {
                return timeSpan.ToDateTimeDiff( dateTime );
            }
        }
    }
}
