using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service.Data
{
    public interface IPostService
    {
        IQueryable<Post> SelectList();
        IQueryable<Post> SelectList( Expression<Func<Post, bool>> whereCondition );

        IEnumerable<Post> SelectListByLocation();
        IEnumerable<Post> SelectListByLocation( Expression<Func<Post, bool>> wherePostCondition );
        IEnumerable<Post> SelectListByLocation( Expression<Func<PostLocation, bool>> wherePostLocationCondition );
        IEnumerable<Post> SelectListByLocation( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostLocation, bool>> wherePostLocationCondition );

        IEnumerable<Post> SelectListByTag();
        IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition );
        IEnumerable<Post> SelectListByTag( Expression<Func<PostTag, bool>> wherePostTagCondition );
        IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostTag, bool>> wherePostTagCondition );
        IEnumerable<Post> SelectListByTag( Expression<Func<Post, bool>> wherePostCondition, IQueryable<Tag> tagList );

        Post Select(int id);
        void Save( Post entity );
        void Update( Post entity );
        void Delete( Post entity );

        bool IsDuplicate(IQueryable<Post> list, string guid);

        //IEnumerable<Post> SelectPostsByTag(int tagId);
        //IEnumerable<Post> SelectPostsByTag( int tagId, bool isActive );
        //IEnumerable<Post> SelectPostsByTag(string tagName);
        //IEnumerable<Post> SelectPostsByTag( string tagName, bool isActive );
        //IEnumerable<Post> SelectPostsByTag( Tag tag );
        //IEnumerable<Post> SelectPostsByTag( Tag tag, bool isActive );
        //IEnumerable<Post> SelectPostsByTag(IQueryable<Tag> tagList);
        //IEnumerable<Post> SelectPostsByTag(IQueryable<Tag> tagList, bool isActive);
        //IEnumerable<Post> SelectPostsByTag(IQueryable<Tag> tagList, PostCategory postCategory);
        //IEnumerable<Post> SelectPostsByTag(IQueryable<Tag> tagList, PostCategory postCategory, bool isActive);


        //IEnumerable<Post> SelectPostsByCategory( int categoryId );
        //IEnumerable<Post> SelectPostsByCategory( int categoryId, bool isActive );
        //IEnumerable<Post> SelectPostsByCategory( string categoryName );
        //IEnumerable<Post> SelectPostsByCategory( string categoryName, bool isActive );

        //IEnumerable<Post> SelectPostsByFeed( int feedId );
        //IEnumerable<Post> SelectPostsByFeed( int feedId, bool isActive );
        //IEnumerable<Post> SelectPostsByFeed( string feedName );
        //IEnumerable<Post> SelectPostsByFeed( string feedName, bool isActive );

        
    }
}
