using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Interface
{
    public interface ILocationRepository
    {
        //Query Lists
        IQueryable<Location> SelectLocations();
        IQueryable<Location> SelectLocationsByCategory( int id );
        IQueryable<Location> SelectLocationsByCategory( string name );

        //Query Item
        Location SelectLocation( int id );
        Location SelectLocation( string name );


        // Insert/Delete
        void Add( Location location );
        void Delete( Location location );

        // Persistence
        void Save();


    }
}
