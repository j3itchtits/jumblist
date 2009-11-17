using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.DataAccess.Interface;
using Jumblist.Data.Model;

namespace Jumblist.Data.DataAccess.Repository
{
    public class LocationRepository : ILocationRepository
    {
        private JumblistDataContext dataContext;

        public LocationRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }

        #region ILocationRespository Members

        public IQueryable<Location> Locations
        {
            get { return dataContext.Locations; }
        }

        public IQueryable<Location> SelectLocations()
        {
            return dataContext.Locations;
        }

        public IQueryable<Location> SelectLocationsByCategory( int id )
        {
            return from l in dataContext.Locations
                   where l.LocationCategoryId == id
                   select l;
        }

        public IQueryable<Location> SelectLocationsByCategory( string name )
        {
            return from l in dataContext.Locations
                   where l.Category.Name == name
                   select l;
        }

        public Location SelectLocation( int id )
        {
            return dataContext.Locations.SingleOrDefault( location => location.LocationId == id ); 
        }

        public Location SelectLocation( string name )
        {
            return dataContext.Locations.FirstOrDefault( location => location.Name == name ); 
        }

        public void Add( Location location )
        {
            throw new NotImplementedException();
        }

        public void Delete( Location location )
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
