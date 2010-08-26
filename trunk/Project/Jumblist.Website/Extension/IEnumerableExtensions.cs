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
            return list.AsQueryable()
                .Where( filter )
                .Select( p => (new Pushpin( p.Latitude.Randomize(), p.Longitude.Randomize(), HttpUtility.HtmlEncode( p.Title ), "<a href=\'" + string.Format( "/post/{0}/{1}", p.PostId, p.Title.ToFriendlyUrlEncode() ) + "\'>" + HttpUtility.HtmlEncode( p.Title ) + "</a>" )) );
        }

        public static IEnumerable<Pushpin> ToFilteredPushPinList( this IEnumerable<Post> list, Func<Post, bool> filter )
        {
            return list
                .Where( filter )
                .Select( p => (new Pushpin( p.Latitude.Randomize(), p.Longitude.Randomize(), HttpUtility.HtmlEncode( p.Title ), "<a href=\'" + string.Format( "/post/{0}/{1}", p.PostId, p.Title.ToFriendlyUrlEncode() ) + "\'>" + HttpUtility.HtmlEncode( p.Title ) + "</a>" )) );
        }
    }
}
