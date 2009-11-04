using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Interface;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Repository
{
    public class TagCategoryRepository : ITagCategoryRepository
    {
        private JumblistDataContext dataContext;

        public TagCategoryRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }

        #region ITagCategoryRepository Members

        public IQueryable<TagCategory> TagCategories
        {
            get { return dataContext.TagCategories; }
        }

        public IQueryable<TagCategory> SelectTagCategories()
        {
            return dataContext.TagCategories;
        }

        public TagCategory SelectTagCategory( int id )
        {
            return dataContext.TagCategories.SingleOrDefault( category => category.TagCategoryId == id );
        }

        public TagCategory SelectTagCategory( string name )
        {
            return dataContext.TagCategories.FirstOrDefault( category => category.Name == name );
        }

        public void Add( TagCategory tagCategory )
        {
            throw new NotImplementedException();
        }

        public void Delete( TagCategory tagCategory )
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
