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
        public static string ToFormattedList( this Array list, string format )
        {

            StringBuilder sb = new StringBuilder();
            foreach (object item in list)
            {
                sb.AppendFormat( format, item.ToString() );
            }

            return sb.ToString();

        }
    }
}
