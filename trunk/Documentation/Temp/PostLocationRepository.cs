using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Interface;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Repository
{
    public class PostLocationRepository : IPostLocationRepository
    {
        private JumblistDataContext dataContext;

        public PostLocationRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }


        #region IPostLocationRepository Members

        public IQueryable<PostLocation> PostLocations
        {
            get { return dataContext.PostLocations; }
        }

        public IQueryable<PostLocation> SelectPostLocations()
        {
            return dataContext.PostLocations;
        }

        public IQueryable<PostLocation> SelectPostLocationsByPostId( int postId )
        {
            return from p in dataContext.PostLocations
                   where p.PostId == postId
                   select p;
        }

        public IQueryable<PostLocation> SelectPostLocationsByLocationId( int locationId )
        {
            return from p in dataContext.PostLocations
                   where p.LocationId == locationId
                   select p;
        }

        #endregion
    }
}
