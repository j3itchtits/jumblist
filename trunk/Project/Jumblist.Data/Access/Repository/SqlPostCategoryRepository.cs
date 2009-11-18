using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Model;

namespace Jumblist.Data.Access
{
    public class SqlPostCategoryRepository : IPostCategoryRepository
    {
        private JumblistDataContext dataContext;

        public SqlPostCategoryRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }

        #region IPostCategoryRepository Members

        public IQueryable<PostCategory> PostCategories
        {
            get { return dataContext.PostCategories; }
        }

        public IQueryable<PostCategory> SelectPostCategories()
        {
            return dataContext.PostCategories;
        }

        public PostCategory SelectPostCategory( int id )
        {
            return dataContext.PostCategories.SingleOrDefault( category => category.PostCategoryId == id );
        }

        public PostCategory SelectPostCategory( string name )
        {
            return dataContext.PostCategories.FirstOrDefault( category => category.Name == name );
        }

        public void Add( PostCategory postCategory )
        {
            throw new NotImplementedException();
        }

        public void Delete( PostCategory postCategory )
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
