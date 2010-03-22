using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Linq.Expressions;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Service.Data;

namespace Jumblist.Core.Model
{
    public partial class PostLocation
    {
        public static Expression<Func<PostLocation, bool>> WhereEquals( int postId, int locationId )
        {
            return x => ( x.PostId == postId && x.LocationId == locationId );
        }

        public static Expression<Func<PostLocation, bool>> WherePostEquals( Post post )
        {
            return x => x.PostId == post.PostId;
        }

        public static Expression<Func<PostLocation, bool>> WherePostIdEquals( int postId )
        {
            return x => x.PostId == postId;
        }

        public static Expression<Func<PostLocation, bool>> WhereLocationEquals( Location location )
        {
            return x => x.LocationId == location.LocationId;
        }

        public static Expression<Func<PostLocation, bool>> WhereLocationIdEquals( int locationId )
        {
            return x => x.LocationId == locationId;
        }

        public static Expression<Func<PostLocation, bool>> WhereLocationNameEquals( string locationName )
        {
            return x => x.Location.Name.FriendlyUrlEncode() == locationName;
        }

        public static Expression<Func<PostLocation, bool>> WhereLocationNameListEqualsOr( IEnumerable<Location> locationList )
        {
            var condition = PredicateBuilder.False<PostLocation>();

            foreach (var location in locationList)
            {
                string temp = location.Name;
                condition = condition.Or(x => x.Location.Name == temp);
            }

            return condition;
        }
    }
}
