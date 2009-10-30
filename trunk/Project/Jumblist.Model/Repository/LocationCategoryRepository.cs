using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Interface;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Repository
{
    public class LocationCategoryRepository : ILocationCategoryRepository
    {
        private JumblistDataContext dataContext;

        public LocationCategoryRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }

        #region ILocationCategoryRepository Members

        public IQueryable<LocationCategory> SelectLocationsCategories()
        {
            return dataContext.LocationCategories;
        }

        public LocationCategory SelectLocationCategory( int id )
        {
            throw new NotImplementedException();
        }

        public LocationCategory SelectLocationCategory( string name )
        {
            throw new NotImplementedException();
        }

        public void Add( LocationCategory locationCategory )
        {
            throw new NotImplementedException();
        }

        public void Delete( LocationCategory locationCategory )
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
