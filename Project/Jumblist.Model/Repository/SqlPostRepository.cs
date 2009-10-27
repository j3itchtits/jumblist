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
        private JumblistDataContext dataContext;

        public SqlPostRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }

        #region IPostRepository Members

        public IQueryable<Post> SelectPosts()
        {
            return dataContext.Posts;
        }

        public IQueryable<Post> SelectPostsByCategory( int categoryId )
        {
            return from p in dataContext.Posts
                   where p.CategoryId == categoryId
                   select p;
        }

        public IQueryable<Post> SelectPostsByLocation(float latitude, float longitude, int distance)
        {
            return from p in dataContext.Posts
                   join loc in dataContext.NearestPosts(latitude, longitude, distance)
                   on p.PostId equals loc.PostId
                   select p;
        }

        public IQueryable<Post> SelectPostsByTag(string tagName)
        {
            return from p in dataContext.Posts
                   join pt in dataContext.PostTags on p.PostId equals pt.PostId
                   join t in dataContext.Tags on pt.TagId equals t.TagId
                   where t.Name == tagName
                   select p;
        }

        public IQueryable<Post> SelectPostsByTagLocation(string tagName, float latitude, float longitude, int distance)
        {
            throw new NotImplementedException();
        }

        public Post SelectPost( int postId )
        {
            return dataContext.Posts.SingleOrDefault(post => post.PostId == postId);
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
