using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Interface
{
    public interface ILocationCategoryRepository
    {
        //Query Lists
        IQueryable<LocationCategory> SelectLocationsCategories();

        //Query Item
        LocationCategory SelectLocationCategory( int id );
        LocationCategory SelectLocationCategory( string name );

        // Insert/Delete
        void Add( LocationCategory locationCategory );
        void Delete( LocationCategory locationCategory );

        // Persistence
        void Save();


    }
}
