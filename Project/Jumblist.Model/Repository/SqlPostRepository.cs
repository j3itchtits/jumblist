using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Abstract;
using Jumblist.Model.Entity;
using System.Data.Linq;

namespace Jumblist.Model.Repository
{
    public class SqlPostRepository : IPostRepository
    {
        private DataContext dataContext;

        public SqlPostRepository( string connectionString )
        {
            dataContext = new DataContext( connectionString );
        }

        #region IPostRepository Members

        public IQueryable<Post> SelectPosts()
        {
            return dataContext.GetTable<Post>();
        }

        public IQueryable<Post> SelectPostsByCategory( int categoryId )
        {
            return from post in SelectPosts()
                   where post.CategoryId == categoryId
                   select post;
        }

        public Post SelectPost( int postId )
        {
            return SelectPosts().SingleOrDefault( post => post.PostId == postId );
        }

        public void Add( Post post )
        {
            throw new NotImplementedException();
        }

        public void Delete( Post post )
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
