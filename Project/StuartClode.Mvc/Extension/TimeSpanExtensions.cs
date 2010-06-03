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
                string time = (timeSpan.Seconds == 1) ? "sec" : "secs";
                return timeSpan.Seconds.ToString() + " " + time + " ago";
            }
            else if ( timeSpan.TotalHours < d )
            {
                string time = (timeSpan.Minutes == 1) ? "min" : "mins";
                return timeSpan.Minutes.ToString() + " " + time + " ago";
            }
            else if ( timeSpan.TotalDays < d )
            {
                string time = (timeSpan.Hours == 1) ? "hour" : "hours";
                return timeSpan.Hours.ToString() + " " + time + " ago";
            }
            else if ( timeSpan.TotalDays < days )
            {
                string time = (timeSpan.Days == 1) ? "day" : "days";
                return timeSpan.Days.ToString() + " " + time + " ago";
            }
            else
            {
                string time = (dateTime.Year == DateTime.Now.Year) ? "MMM dd" : "MMM dd, yyyy";
                return dateTime.ToString( time );
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
