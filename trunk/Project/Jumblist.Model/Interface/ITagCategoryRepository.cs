using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Interface
{
    public interface ITagCategoryRepository
    {
        //Query Lists
        IQueryable<TagCategory> TagCategories { get; }
        IQueryable<TagCategory> SelectTagCategories();
               
        //Query Item
        TagCategory SelectTagCategory( int id );
        TagCategory SelectTagCategory( string name );


        // Insert/Delete
        void Add( TagCategory tagCategory );
        void Delete( TagCategory tagCategory );

        // Persistence
        void Save();


    }
}
