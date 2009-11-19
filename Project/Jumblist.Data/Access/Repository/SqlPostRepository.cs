using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Entity;
using System.Data.Linq;

namespace Jumblist.Data.Access
{
    public class SqlPostRepository : Repository, IPostRepository
    {
        private JumblistDataContext dataContext;

        public SqlPostRepository()
        {
            dataContext = new JumblistDataContext( base.ConnectionString );
        }

        public SqlPostRepository( string connectionString )
        {
            dataContext = new JumblistDataContext( connectionString );
        }

        #region IPostRepository Members

        public IQueryable<Post> Posts
        {
            get { return dataContext.Posts; }
        }

        public IQueryable<Post> SelectPosts()
        {
            return dataContext.Posts;
        }

        public IQueryable<Post> SelectPostsByCategory( int categoryId )
        {
            return from p in dataContext.Posts
                   where p.PostCategoryId == categoryId
                   select p;
        }

        public IQueryable<Post> SelectPostsByLocation( float latitude, float longitude, int distance )
        {
            return from p in dataContext.Posts
                   join loc in dataContext.NearestPosts(latitude, longitude, distance)
                   on p.PostId equals loc.PostId
                   select p;
        }

        public IQueryable<Post> SelectPostsByLocation( string locationName )
        {
            return from p in dataContext.Posts
                   join pl in dataContext.PostLocations on p.PostId equals pl.PostId
                   join l in dataContext.Locations on pl.LocationId equals l.LocationId
                   where l.Name == locationName
                   select p;
        }

        public IQueryable<Post> SelectPostsByTag( string tagName )
        {
            return from p in dataContext.Posts
                   join pt in dataContext.PostTags on p.PostId equals pt.PostId
                   join t in dataContext.Tags on pt.TagId equals t.TagId
                   where t.Name == tagName
                   select p;
        }

        public IQueryable<Post> SelectPostsByAuthor( string authorName )
        {
            return from p in dataContext.Posts
                   join a in dataContext.Authors on p.AuthorId equals a.AuthorId
                   where a.Name == authorName
                   select p;
        }

        public IQueryable<Post> SelectPostsByFeed( string feedTitle )
        {
            return from p in dataContext.Posts
                   join f in dataContext.Feeds on p.FeedId equals f.FeedId
                   where f.TitleUrlEncoded == feedTitle
                   select p;
        }

        public IQueryable<Post> SelectPostsByTagLocation(string tagName, float latitude, float longitude, int distance)
        {
            throw new NotImplementedException();
        }

        public Post SelectPost( int postId )
        {
            return dataContext.Posts.SingleOrDefault( post => post.PostId == postId );
        }

        public Post SelectPost( string title )
        {
            return dataContext.Posts.FirstOrDefault( post => post.Title == title );
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
