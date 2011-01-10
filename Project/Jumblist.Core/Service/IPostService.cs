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
        
        IEnumerable<Post> RecordList( Expression<Func<PostLocation, bool>> wherePostLocationCondition );
        IEnumerable<Post> RecordList( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostLocation, bool>> wherePostLocationCondition );
        IEnumerable<Post> RecordList( Expression<Func<PostTag, bool>> wherePostTagCondition );
        IEnumerable<Post> RecordList( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostTag, bool>> wherePostTagCondition );

        IEnumerable<Post> RecordList( string[] q );
        IEnumerable<Post> RecordList( string[] q, UserSearchArea userSearchArea );
 
        IEnumerable<Post> RecordList( PostCategory category, string[] q );
        IEnumerable<Post> RecordList( PostCategory category, string[] q, UserSearchArea userSearchArea );

        IEnumerable<Post> RecordList( Feed feed, PostCategory category );
        IEnumerable<Post> RecordList( Feed feed, PostCategory category, string[] q );
        IEnumerable<Post> RecordList( Feed feed, PostCategory category, string[] q, UserSearchArea userSearchArea );

        IEnumerable<Post> RecordList( IEnumerable<Tag> tagList, PostCategory category, string[] q );
        IEnumerable<Post> RecordList( IEnumerable<Tag> tagList, PostCategory category, string[] q, UserSearchArea userSearchArea );

        IEnumerable<Post> RecordList( IEnumerable<Location> locationList, PostCategory category );
        IEnumerable<Post> RecordList( IEnumerable<Location> locationList, PostCategory category, string[] q );

        IEnumerable<Post> RecordList( PostListRouteValues postListRouteValues, UserSearchArea userSearchArea );
        IEnumerable<Post> RecordList( string action, string id, string category, string q, UserSearchArea userSearchArea );

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
