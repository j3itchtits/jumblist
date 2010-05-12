﻿using System;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Model
{
    [Flags]
    public enum TemporalGroupType
    {
        [TimeSpan( "year", Days = 365 )]
        year = 1,

        [TimeSpan( "month", Days = 30, Hours = 12 )]
        month = 2,

        [TimeSpan( "week", Days = 7 )]
        week = 4,

        [TimeSpan( "day", Days = 1 )]
        day = 8,

        [TimeSpan( "hour", Hours = 1 )]
        hour = 16,

        [TimeSpan( "minute", Minutes = 1 )]
        minute = 32,

        [TimeSpan( "second", Seconds = 1 )]
        second = 64
    }

    internal class TimeSpanAttribute : Attribute
    {
        public int Days { get; set; }
        public int Hours { get; set; }
        public int Minutes { get; set; }
        public int Seconds { get; set; }
        public string Name { get; private set; }

        public TimeSpanAttribute( string name )
        {
            this.Name = name;
        }

        /// <summary>
        /// Calculates and returns the Timespan for this attributes state
        /// </summary>
        public TimeSpan GetTimeSpan()
        {
            return new TimeSpan(
                this.Days, this.Hours,
                this.Minutes, this.Seconds );
        }

        /// <summary>
        /// Uses reflection to retrieve an instance of this attribute 
        /// on a given enum
        /// </summary>
        public static TimeSpanAttribute RetrieveAttribute( Enum target )
        {
            object[] attributes =
                    target.GetType().GetField( target.ToString() ).GetCustomAttributes(
                        typeof( TimeSpanAttribute ), true );

            if ( attributes != null && attributes.Length > 0 )
                return (TimeSpanAttribute)attributes[0];
            else
                return null;
        }

    }


    public static class TimeSpanArticulator
    {
        private static readonly string Seperator = ",";
        private static readonly string Plural = "s";
        private static readonly string And = "and";
        private static readonly string Space = " ";

        private const TemporalGroupType defaultAccuracy =
            TemporalGroupType.second | TemporalGroupType.minute |
            TemporalGroupType.hour | TemporalGroupType.day |
            TemporalGroupType.week | TemporalGroupType.month |
            TemporalGroupType.year;

        internal class TemporalGrouping
        {
            /// <summary>
            /// The type of the temporal grouping
            /// e.g. 'hour' or 'day'
            /// </summary>
            internal TemporalGroupType Type
            {
                get;
                private set;
            }

            /// <summary>
            /// The size of the temporal grouping.
            /// e.g. '1' hour, or '3' hours
            /// </summary>
            internal int Magnitude
            {
                get;
                private set;
            }

            internal TemporalGrouping(
                TemporalGroupType type, int magnitude )
            {
                this.Type = type;
                this.Magnitude = magnitude;
            }

            public override string ToString()
            {
                string result = this.Magnitude.ToString();

                result += " " + TimeSpanAttribute.RetrieveAttribute( this.Type ).Name;

                if ( this.Magnitude > 1 )
                {
                    result += Plural;
                }

                return result;
            }
        }

        // a cache of all the TemporalGroupTypes
        private static List<TemporalGroupType> groupTypes;

        // static contructor
        static TimeSpanArticulator()
        {
            groupTypes = new List<TemporalGroupType>( Enum.GetValues(
                    typeof( TemporalGroupType ) ) as IEnumerable<TemporalGroupType> );
        }

        /// <summary>
        /// Articulates a given TimeSpan using the default accuracy
        /// </summary>
        /// <param name="span">The TimeSpan to articulate</param>
        public static string Articulate( TimeSpan span )
        {
            return Articulate( span, defaultAccuracy );
        }

        /// <param name="span">The TimeSpan to articulate</param>
        /// <param name="accuracy">Accuracy Flags</param>
        public static string Articulate( TimeSpan span, TemporalGroupType accuracy )
        {
            // populate a list with temporalgroupings. Each temporal grouping
            // represents a particular element of the articulation, ordered
            // accoring to the temporal duration of each element.

            List<TemporalGrouping> groupings =
                new List<TemporalGrouping>( 4 );

            // foreach possible temporal type (day/hour/minute etc.)
            foreach ( TemporalGroupType type in groupTypes )
            {
                // if the temporal type isn't specified in the accuracy, skip.
                if ( (accuracy & type) != type ) continue;

                // get the timespan for this temporal type
                TimeSpan ts = TimeSpanAttribute.RetrieveAttribute( type ).GetTimeSpan();

                if ( span.Ticks >= ts.Ticks )
                {
                    // divide the current timespan with the temporal group span
                    int magnitude = (int)(span.Ticks / ts.Ticks);

                    groupings.Add( new TemporalGrouping( type, magnitude ) );

                    span = new TimeSpan( span.Ticks % ts.Ticks );
                }
            }

            return Textify( groupings );
        }


        /// <summary>
        /// converts a list of groupings into text
        /// </summary>
        private static string Textify( IList<TemporalGrouping> groupings )
        {
            string result = String.Empty;

            for ( int i = 0; i < groupings.Count; i++ )
            {
                string groupingStr = groupings[i].ToString();

                if ( i > 0 )
                {
                    if ( i == groupings.Count - 1 )
                    {
                        // this is the last element. Add an "and"
                        // between this and the last.
                        result += Space + And + Space;
                    }
                    else
                    {
                        // add comma between this and the next element
                        result += Seperator + Space;
                    }
                }

                result += groupingStr;
            }

            return result;
        }
    }
}

