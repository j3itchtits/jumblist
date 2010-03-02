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
    public partial class PostTag
    {
        public static Expression<Func<PostTag, bool>> TagIdEquals( int tagId )
        {
            return x => x.TagId == tagId;
        }

        public static Expression<Func<PostTag, bool>> TagNameEquals( string tagName )
        {
            Expression<Func<PostTag, bool>> condition = x => x.Tag.Name.ToFriendlyUrl() == tagName;
            return condition;
        }

        public static Expression<Func<PostTag, bool>> TagNameEqualsListOr(string[] tagList)
        {
            return x => tagList.Contains( x.Tag.FriendlyUrl );
        }

        public static Expression<Func<PostTag, bool>> TagNameEqualsListOr(IQueryable<Tag> tagList)
        {
            var condition = PredicateBuilder.False<PostTag>();

            foreach (Tag tag in tagList)
            {
                string temp = tag.Name;
                condition = condition.Or( x => x.Tag.Name == temp );
            }

            return condition;
        }

        public static Expression<Func<PostTag, bool>> TagNameEqualsListAnd(IQueryable<Tag> tagList)
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
