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

        public static Expression<Func<Post, bool>> DisplayEquals( bool isActive )
        {
            return x => x.Display == isActive;
        }

        public static Expression<Func<Post, bool>> PostCategoryEquals(PostCategory postCategory)
        {
            return x => x.PostCategoryId == postCategory.PostCategoryId;
        }

        public static Expression<Func<Post, bool>> FeedEquals(Feed feed)
        {
            return x => x.FeedId == feed.FeedId;
        }

        public static Expression<Func<Post, bool>> TagNameEqualsListAnd(IQueryable<Tag> tagList)
        {
            var condition = PredicateBuilder.True<Post>();

            foreach (Tag tag in tagList)
            {
                string temp = tag.Name;
                condition = condition.And(x => x.PostTags.Where( y => y.Tag.Name == temp ));
            }

            return condition;
        }
    }
}
