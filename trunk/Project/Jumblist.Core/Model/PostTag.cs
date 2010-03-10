using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Linq.Expressions;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Service.Data;
using Microsoft.Practices.ServiceLocation;

namespace Jumblist.Core.Model
{
    public partial class PostTag
    {
        public static Expression<Func<PostTag, bool>> WhereEquals( int postId, int tagId )
        {
            return x => ( x.PostId == postId && x.TagId == tagId );
        }

        public static Expression<Func<PostTag, bool>> WherePostEquals( Post post )
        {
            return x => x.PostId == post.PostId;
        }

        public static Expression<Func<PostTag, bool>> WherePostIdEquals( int postId )
        {
            return x => x.PostId == postId;
        }

        public static Expression<Func<PostTag, bool>> WhereTagEquals( Tag tag )
        {
            return x => x.TagId == tag.TagId;
        }

        public static Expression<Func<PostTag, bool>> WhereTagIdEquals( int tagId )
        {
            return x => x.TagId == tagId;
        }

        public static Expression<Func<PostTag, bool>> WhereTagNameEquals( string tagName )
        {
            return x => x.Tag.Name == tagName;
        }

        public static Expression<Func<PostTag, bool>> WhereFriendlyUrlListEqualsOr( string[] tagList )
        {
            return x => tagList.Contains( x.Tag.FriendlyUrl );
        }

        public static Expression<Func<PostTag, bool>> WhereTagNameListEqualsOr( IQueryable<Tag> tagList )
        {
            var condition = PredicateBuilder.False<PostTag>();

            foreach ( var tag in tagList )
            {
                string temp = tag.Name;
                condition = condition.Or( x => x.Tag.Name == temp );
            }

            return condition;
        }

        public static Expression<Func<PostTag, bool>> WhereTagNameListEqualsAnd( IQueryable<Tag> tagList )
        {
            var postTagDataService = ServiceLocator.Current.GetInstance<IDataService<PostTag>>();
            
            var condition = PredicateBuilder.True<PostTag>();

            foreach ( var tag in tagList )
            {
                string temp = tag.Name;
                var list = postTagDataService.SelectRecordList().Where( x => x.Tag.Name == temp ).Select( x => x.PostId ).ToArray();
                condition = condition.And( x => list.Contains( x.PostId ) );
            }

            return condition;
        }



    }
}
