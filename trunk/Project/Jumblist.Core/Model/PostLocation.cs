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
        public static Expression<Func<PostLocation, bool>> LocationIdEquals( int locationId )
        {
            return x => x.LocationId == locationId;
        }

        public static Expression<Func<PostLocation, bool>> LocationNameEquals( string locationName )
        {
            return x => x.Location.Name.ToFriendlyUrl() == locationName;
        }

        public static Expression<Func<PostLocation, bool>> Duplicate(int postId, int locationId)
        {
            return x => x.PostId == postId && x.LocationId == locationId;
        }
    }
}
