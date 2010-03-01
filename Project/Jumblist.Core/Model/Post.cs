using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Linq.Expressions;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Service.Data;

namespace Jumblist.Core.Model
{
    public partial class Post
    {
        public IList<Location> Locations
        {
            get { return postLocations.Select( l => l.Location ).ToList().AsReadOnly(); }
        }

        public IList<Tag> Tags
        {
            get { return postTags.Select( t => t.Tag ).ToList().AsReadOnly(); }
        }

        public static Expression<Func<Post, bool>> WhereDisplay( bool isActive )
        {
            return x => x.Display == isActive;
        }

        public static Expression<Func<Post, bool>> WherePostCategoryAndDisplay( PostCategory postCategory,  bool isActive )
        {
            return x => ( x.PostCategoryId == postCategory.PostCategoryId && x.Display == isActive );
        }

        public static Expression<Func<PostLocation, bool>> WhereLocationId( int locationId )
        {
            return x => x.LocationId == locationId;
        }

        public static Expression<Func<PostLocation, bool>> WhereLocationName( string locationName )
        {
            return x => x.Location.Name.ToFriendlyUrl() == locationName;
        }

        public static Expression<Func<PostTag, bool>> WhereTagId( int tagId )
        {
            return x => x.TagId == tagId;
        }

        public static Expression<Func<PostTag, bool>> WhereTagName( string tagName )
        {
            Expression<Func<PostTag, bool>> condition = x => x.Tag.Name.ToFriendlyUrl() == tagName;
            return condition;
        }

        public static Expression<Func<PostTag, bool>> WhereTagNameOr( string[] tagList )
        {
            return x => tagList.Contains( x.Tag.FriendlyUrl );
        }

        public static Expression<Func<PostTag, bool>> WhereTagNameOr( IQueryable<Tag> tagList )
        {
            var condition = PredicateBuilder.False<PostTag>();

            foreach (Tag tag in tagList)
            {
                string temp = tag.Name;
                condition = condition.Or( x => x.Tag.Name == temp );
            }

            return condition;
        }

        public static Expression<Func<PostTag, bool>> WhereTagNameAnd( IQueryable<Tag> tagList )
        {
            var condition = PredicateBuilder.True<PostTag>();

            //condition = condition.And( x => x.Tag.Name == "Baby" );
            //condition = condition.And( x => x.Tag.Name == "Clothes" );

            //condition = condition.And( x => x.TagId == 43 );
            //condition = condition.And( x => x.TagId == 9 );

            foreach (Tag tag in tagList)
            {
                string temp = tag.Name;
                condition = condition.And( x => x.Tag.Name == temp );
            }

            return condition;
        }
    }
}
