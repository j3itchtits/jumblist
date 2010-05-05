using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using MvcMaps;
using StuartClode.Mvc.Extension;
using System.Web;

namespace Jumblist.Website.Extension
{
    public static class IEnumerableExtensions
    {
        public static IEnumerable<Pushpin> ToFilteredPushPinList(this IEnumerable<Post> list, Expression<Func<Post, bool>> filter)
        {
            return list.AsQueryable().Where( filter ).Select( p => (new Pushpin( p.Latitude.Randomize(), p.Longitude.Randomize(), HttpUtility.HtmlEncode( p.Title ), HttpUtility.HtmlEncode( p.Title ) )) );
        }

        public static string ToLinkedTagList( this IEnumerable<Tag> list )
        {
            var sb = new StringBuilder();
            list.ToList().ForEach( x => sb.AppendFormat( "<a href='/posts/tagged/{0}'>{1}</a>, ", x.FriendlyUrl, x.Name ) );
            return sb.ToString().RemoveRight( 2 );
        }

        public static string ToLinkedLocationList( this IEnumerable<Location> list )
        {
            var sb = new StringBuilder();
            list.ToList().ForEach( x => sb.AppendFormat( "<a href='/posts/located/{0}'>{1}</a>, ", x.FriendlyUrl, x.Name ) );
            return sb.ToString().RemoveRight( 2 );
        }
        
    }
}
