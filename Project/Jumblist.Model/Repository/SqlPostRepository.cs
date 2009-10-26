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
        private Table<Post> postTable;

        public SqlPostRepository( string connectionString )
        {
            postTable = (new DataContext(connectionString)).GetTable<Post>();
        }

        #region IPostRepository Members

        public IQueryable<Post> SelectPosts()
        {
            return postTable;
        }

        public IQueryable<Post> SelectPostsByCategory(int postCategoryId)
        {
            return postTable;
            //var posts = from post in SelectPosts()

        }

        public Post GetPost(int id)
        {
            throw new NotImplementedException();
        }

        public void Add(Post post)
        {
            throw new NotImplementedException();
        }

        public void Delete(Post post)
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
