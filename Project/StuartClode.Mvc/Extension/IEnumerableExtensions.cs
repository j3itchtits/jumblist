using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace StuartClode.Mvc.Extension
{
    public static class ArrayExtensions
    {
        /// <summary>
        /// Creates a formatted list of items based on the passed in format
        /// </summary>
        /// <param name="list">The item list</param>
        /// <param name="format">The single-place format string to use</param>
        public static string ToFormattedStringList<T>( this IEnumerable<T> enumeration, string formattedString )
        {
            var sb = new StringBuilder();
            enumeration.ToList().ForEach( item => sb.AppendFormat( formattedString, item.ToString() ) );

            return sb.ToString();
        }

        public static string ToFormattedStringList<T>( this IEnumerable<T> enumeration, string formattedString, int rightLengthToRemove )
        {
            var result = enumeration.ToFormattedStringList<T>( formattedString );

            return (result.Length == 0) ? string.Empty : result.Remove( result.Length - rightLengthToRemove );
        }

        public static string ToFormattedStringList( this IEnumerable enumeration, string formattedString )
        {
            var sb = new StringBuilder();

            foreach (var item in enumeration)
            {
                sb.AppendFormat( formattedString, item.ToString() );
            }

            return sb.ToString();
        }

        public static string ToFormattedStringList( this IEnumerable enumeration, string formattedString, int rightLengthToRemove )
        {
            var result = enumeration.ToFormattedStringList( formattedString );

            return (result.Length == 0) ? string.Empty : result.Remove( result.Length - rightLengthToRemove );
        }
    }
}
