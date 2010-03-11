using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Linq.Expressions;

namespace Jumblist.Core.Model
{
    public partial class Feed
    {
        public IList<Location> Locations
        {
            get { return feedLocations.Select(l => l.Location).ToList().AsReadOnly(); }
        }

        public static Expression<Func<Feed, bool>> WhereNotEquals( Feed feed )
        {
            return x => x.FeedId != feed.FeedId;
        }

        public static Expression<Func<Feed, bool>> WhereEquals( Feed feed )
        {
            return x => x.Url == feed.Url;
        }

        public static Expression<Func<Feed, bool>> WhereUrlEquals( string url )
        {
            return x => x.Url == url;
        }

        public static Expression<Func<Feed, bool>> WhereNameEquals( string name )
        {
            return x => x.Name == name;
        }

        public static Expression<Func<Feed, bool>> WhereFriendlyUrlEquals( string friendlyUrl )
        {
            return x => x.FriendlyUrl == friendlyUrl;
        }
    }
}
