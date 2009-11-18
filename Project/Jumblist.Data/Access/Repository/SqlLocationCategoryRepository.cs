using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Model;

namespace Jumblist.Data.Access
{
    public class SqlLocationCategoryRepository : ILocationCategoryRepository
    {
        private JumblistDataContext dataContext;

        public SqlLocationCategoryRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }

        #region ILocationCategoryRepository Members

        public IQueryable<LocationCategory> LocationCategories
        {
            get { return dataContext.LocationCategories; }
        }

        public IQueryable<LocationCategory> SelectLocationCategories()
        {
            return dataContext.LocationCategories;
        }

        public LocationCategory SelectLocationCategory( int id )
        {
            return dataContext.LocationCategories.SingleOrDefault( category => category.LocationCategoryId == id );
        }

        public LocationCategory SelectLocationCategory( string name )
        {
            return dataContext.LocationCategories.FirstOrDefault( category => category.Name == name );
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
