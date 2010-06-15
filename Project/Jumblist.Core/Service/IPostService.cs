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
        //IEnumerable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition, User user );

        IEnumerable<Post> SelectRecordList( Expression<Func<PostLocation, bool>> wherePostLocationCondition );
        IEnumerable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostLocation, bool>> wherePostLocationCondition );

        IEnumerable<Post> SelectRecordList( Expression<Func<PostTag, bool>> wherePostTagCondition );
        IEnumerable<Post> SelectRecordList( Expression<Func<Post, bool>> wherePostCondition, Expression<Func<PostTag, bool>> wherePostTagCondition );

        IEnumerable<Post> SelectRecordList( string[] q );
        IEnumerable<Post> SelectRecordList( User user );
        IEnumerable<Post> SelectRecordList( string[] q, User user );

        IEnumerable<Post> SelectRecordList( PostCategory category, string[] q );
        IEnumerable<Post> SelectRecordList( PostCategory category, string[] q, User user );

        IEnumerable<Post> SelectRecordList( Feed feed, PostCategory category );
        IEnumerable<Post> SelectRecordList( Feed feed, PostCategory category, string[] q );

        IEnumerable<Post> SelectRecordList( IEnumerable<Tag> tagList, PostCategory category, string[] q );
        IEnumerable<Post> SelectRecordList( IEnumerable<Tag> tagList, PostCategory category, string[] q, User user );

        IEnumerable<Post> SelectRecordList( IEnumerable<Location> locationList, PostCategory category );
        IEnumerable<Post> SelectRecordList( IEnumerable<Location> locationList, PostCategory category, string[] q );

        Post SelectRecord( int id );
        Post SelectRecord( Expression<Func<Post, bool>> whereCondition );

        void Save( Post entity );
        void Save( Post entity, bool isDetachedFromDatabase );
        void Import( Post entity );
        void Delete( Post entity );
        void Email( int postId, User user );
        int ExtractPostCategoryId( Post post );

        void SavePostTags( Post post, string tags );
    }
}
