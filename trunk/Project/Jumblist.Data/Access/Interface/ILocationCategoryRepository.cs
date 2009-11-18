using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Entity;

namespace Jumblist.Data.Access
{
    public interface ILocationCategoryRepository
    {
        //Query Lists
        IQueryable<LocationCategory> LocationCategories { get; }
        IQueryable<LocationCategory> SelectLocationCategories();
               
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
