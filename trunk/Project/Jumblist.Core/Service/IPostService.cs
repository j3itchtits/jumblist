using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service
{
    public interface IPostService
    {
        IQueryable<Post> SelectRecordList();
        IQueryable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition );
        
        IEnumerable<Post> SelectRecordList( Expression<Func<PostLocation, bool>> wherePostLocationCondition );
        IEnumerable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostLocation, bool>> wherePostLocationCondition );
        IEnumerable<Post> SelectRecordList( Expression<Func<PostTag, bool>> wherePostTagCondition );
        IEnumerable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostTag, bool>> wherePostTagCondition );

        IEnumerable<Post> SelectRecordList( string[] q );
        IEnumerable<Post> SelectRecordList( string[] q, UserSearchArea userSearchArea );
 
        IEnumerable<Post> SelectRecordList( PostCategory category, string[] q );
        IEnumerable<Post> SelectRecordList( PostCategory category, string[] q, UserSearchArea userSearchArea );

        IEnumerable<Post> SelectRecordList( Feed feed, PostCategory category );
        IEnumerable<Post> SelectRecordList( Feed feed, PostCategory category, string[] q );
        IEnumerable<Post> SelectRecordList( Feed feed, PostCategory category, string[] q, UserSearchArea userSearchArea );

        IEnumerable<Post> SelectRecordList( IEnumerable<Tag> tagList, PostCategory category, string[] q );
        IEnumerable<Post> SelectRecordList( IEnumerable<Tag> tagList, PostCategory category, string[] q, UserSearchArea userSearchArea );

        IEnumerable<Post> SelectRecordList( IEnumerable<Location> locationList, PostCategory category );
        IEnumerable<Post> SelectRecordList( IEnumerable<Location> locationList, PostCategory category, string[] q );

        IEnumerable<Post> GetPostList( PostListRouteValues postListRouteValues, UserSearchArea userSearchArea );
        IEnumerable<Post> GetPostList( string action, string id, string category, string q, UserSearchArea userSearchArea );

        Post SelectRecord( int id );
        Post SelectRecord( Expression<Func<Post, bool>> whereCondition );

        void Save( Post entity );
        void Save( Post entity, bool isDetachedFromDatabase );
        void Import( Post entity );
        void Delete( Post entity );
        int ExtractPostCategoryId( Post post );

        IList<PostTag> SavePostTags( Post post, string tagSearch );
        void DeletePostTags( Post post );
        IList<PostLocation> SavePostLocations( ref Post post );
    }
}
