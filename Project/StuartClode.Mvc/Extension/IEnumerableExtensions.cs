using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using StuartClode.Mvc.Model;
using System.Linq.Expressions;

namespace StuartClode.Mvc.Extension
{
    public static class IEnumerableExtensions
    {
        /// <summary>
        /// Creates a formatted list of items based on the passed in format
        /// </summary>
        /// <param name="list">The item list</param>
        /// <param name="format">The single-place format string to use</param>
        public static string ToFormattedStringList<T>( this IEnumerable<T> enumeration, string formattedString )
        {
            var sb = new StringBuilder();
            enumeration.ToList().ForEach( x => sb.AppendFormat( formattedString, x.ToString() ) );
            return sb.ToString();
        }

        public static string ToFormattedStringList<T>( this IEnumerable<T> enumeration, string formattedString, int rightLengthToRemove )
        {
            var result = enumeration.ToFormattedStringList<T>( formattedString );
            return result.RemoveRight( rightLengthToRemove );
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
            return result.RemoveRight( rightLengthToRemove );
        }

        public static string ToFriendlyUrlEncode( this IEnumerable enumeration )
        {
            return enumeration.ToFormattedStringList("{0}, ", 2).ToFriendlyUrlEncode();
        }

        public static string ToNewLineDelimitedString(this IEnumerable<string> enumeration)
        {
            return string.Join("\n", enumeration.ToArray());
        }

        public static IEnumerable<T> ToFilteredList<T>( this IEnumerable<T> list, Expression<Func<T, bool>> filter )
        {
            return list.AsQueryable().Where( filter );
        }

        public static IEnumerable<T> ToFilteredList<T>( this IEnumerable<T> list, Func<T, bool> filter )
        {
            return list.Where( filter );
        }
    }
}
