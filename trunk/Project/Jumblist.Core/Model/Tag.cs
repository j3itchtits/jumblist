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

        public static Expression<Func<Tag, bool>> WhereFriendlyUrlListEqualsOr( string[] tagList )
        {
            return x => tagList.Contains( x.FriendlyUrl );
        }

        public static Expression<Func<Tag, bool>> WhereNameEquals( string name )
        {
            return x => x.Name == name;
        }

        public static Expression<Func<Tag, bool>> WhereEquals( Tag tag )
        {
            return x => x.TagId == tag.TagId;
        }

        public static Expression<Func<Tag, bool>> WhereNotEquals( Tag tag )
        {
            return x => x.TagId != tag.TagId;
        }

        public static Expression<Func<Tag, bool>> WhereFriendlyUrlEquals( string friendlyUrl )
        {
            return x => x.FriendlyUrl == friendlyUrl;
        }
    }
}
