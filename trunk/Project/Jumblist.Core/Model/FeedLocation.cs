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
    public partial class FeedLocation
    {
        public static Expression<Func<FeedLocation, bool>> WhereEquals( int? feedId, int locationId )
        {
            return x => ( x.FeedId == feedId && x.LocationId == locationId );
        }

        public static Expression<Func<FeedLocation, bool>> WhereFeedIdEquals( int? feedId )
        {
            return x => x.FeedId == feedId;
        }

        public static Expression<Func<FeedLocation, bool>> WhereFeedEquals( Feed feed )
        {
            return x => x.FeedId == feed.FeedId;
        }

        public static Expression<Func<FeedLocation, bool>> WhereLocationEquals( Location location )
        {
            return x => x.LocationId == location.LocationId;
        }
    }
}
