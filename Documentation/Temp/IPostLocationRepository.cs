using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Interface
{
    public interface IPostLocationRepository
    {
        //Query Lists
        IQueryable<PostLocation> PostLocations { get; }
        IQueryable<PostLocation> SelectPostLocations();
        IQueryable<PostLocation> SelectPostLocationsByPostId( int postId );
        IQueryable<PostLocation> SelectPostLocationsByLocationId( int locationId );
    }
}
