using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using MvcMaps;

namespace Jumblist.Website.Extension
{
    public static class IEnumerableExtensions
    {
        public static IEnumerable<Pushpin> ToFilteredPushPinList(this IEnumerable<Post> list, Expression<Func<Post, bool>> filter)
        {
            return list.AsQueryable().Where( filter ).Select( p => ( new Pushpin( p.Latitude, p.Longitude, p.Title ) ) );
        }
    }
}
