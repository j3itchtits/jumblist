using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using StuartClode.Mvc.Service.Data;
using System.Linq.Expressions;

namespace Jumblist.Core.Model
{
    public partial class Tag
    {
        public IList<Post> Posts
        {
            get { return postTags.Select( p => p.Post ).ToList().AsReadOnly(); }
        }

        public static Expression<Func<Tag, bool>> WhereBabyOrDress()
        {
            var condition = PredicateBuilder.False<Tag>();
            condition = condition.Or( x => x.Name == "Baby" );
            condition = condition.Or( x => x.Name == "Dress" );

            return condition;
        }

        public static Expression<Func<Tag, bool>> TagNameEqualsListOr( string[] tagList )
        {
            return x => tagList.Contains( x.FriendlyUrl );
        }

        public static Expression<Func<Tag, bool>> Duplicate(string name)
        {
            return p => p.Name == name;
        }
    }
}
