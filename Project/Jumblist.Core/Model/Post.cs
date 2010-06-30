using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Linq.Expressions;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Service.Data;
using System.Text.RegularExpressions;
using System.Data.Linq.SqlClient;
using StuartClode.Mvc.Service.Map;

namespace Jumblist.Core.Model
{
    public partial class Post
    {
        public bool HaveLatitudeAndLongitudeValuesBeenPopulated
        {
            get { return this.Latitude != 0 && this.Longitude != 0; }
        }

        public string LinkbackUrl
        {
            get { return string.Format( "/post/{0}/{1}", PostId, Title.ToFriendlyUrlEncode() ); }
        }

        public IList<Location> Locations
        {
            get { return postLocations.Select( l => l.Location ).ToList().AsReadOnly(); }
        }

        public IList<Tag> Tags
        {
            get { return postTags.Select( t => t.Tag ).ToList().AsReadOnly(); }
        }

        public static Expression<Func<Post, bool>> WhereDisplayEquals( bool isActive )
        {
            return x => x.Display == isActive;
        }

        public static Expression<Func<Post, bool>> WherePostCategoryEquals( PostCategory postCategory )
        {
            return x => x.PostCategoryId == postCategory.PostCategoryId;
        }

        public static Expression<Func<Post, bool>> WherePostCategoryNameEquals( string categoryName )
        {
            return x => x.Category.Name == categoryName;
        }

        public static Expression<Func<Post, bool>> WhereFeedEquals( Feed feed )
        {
            return x => x.FeedId == feed.FeedId;
        }

        public static Expression<Func<Post, bool>> WhereUserEquals( User user )
        {
            return x => x.UserId == user.UserId;
        }

        public static Expression<Func<Post, bool>> WhereUrlEquals( string url )
        {
            return x => x.Url == url;
        }

        public static Expression<Func<Post, bool>> WhereEquals( Post post )
        {
            return x => x.PostId == post.PostId;
        }

        public static Expression<Func<Post, bool>> WhereNotEquals( Post post )
        {
            return x => x.PostId != post.PostId;
        }

        public static Expression<Func<Post, bool>> WhereLatLongValuesExist()
        {
            //need to do it this way rather than using HaveLatitudeAndLongitudeValuesBeenPopulated as we need it to be translated into sql
            return x => (x.Latitude != 0 && x.Longitude != 0);
        }

        public static Func<Post, bool> WhereLatLongValuesExistFunc()
        {
            return x => (x.Latitude != 0 && x.Longitude != 0);
        }

        public static Func<Post, bool> WhereLocationEquals( double latitude, double longitude, int? searchRadiusMiles )
        {
            //this needs to change in order to use the NearestMessage function (somehow)
            var distanceService = new DistanceService();
            return x => ((distanceService.DistanceBetween( latitude, longitude, x.Latitude, x.Longitude, 'M' )) < searchRadiusMiles);
        }

        public static Expression<Func<Post, bool>> WhereSearchTextEquals( string q )
        {
            var condition = PredicateBuilder.False<Post>();
            condition = condition.Or( x => SqlMethods.Like( x.Title + ' ' + x.Body, "%" + q + "%" ) );

            return condition;
        }

        public static Expression<Func<Post, bool>> WhereSearchParamsEqualsAnd( string[] searchParams )
        {
            var condition = PredicateBuilder.True<Post>();

            string[] excludeSearchParams = new string[] { "a", "all", "am", "an", "and", "any", "are", "as", "at", "be", "but", "can", "did", "do", "does", "for", "from", "had", "has", "have", "here", "how", "i", "if", "in", "is", "it", "no", "not", "of", "on", "or", "so", "that", "the", "then", "there", "this", "to", "too", "up", "use", "what", "when", "where", "who", "why", "you" };

            foreach ( var q in searchParams.Except( excludeSearchParams ) )
            {
                string temp = q;
                condition = condition.And( x => SqlMethods.Like( x.Title + ' ' + x.Body, "%" + temp + "%" ) );
            }

            return condition;
        }

        public static Expression<Func<Post, bool>> WhereTagNameListEqualsAnd( IEnumerable<Tag> tagList )
        {
            var condition = PredicateBuilder.True<Post>();

            foreach ( var tag in tagList )
            {
                string temp = tag.Name;
                condition = condition.And( p => p.PostTags.Any( pt => pt.Tag.Name == temp ) );
            }

            return condition;
        }

        public static Expression<Func<Post, bool>> WhereLocationNameListEqualsOr( IEnumerable<Location> locationList )
        {
            var condition = PredicateBuilder.False<Post>();

            foreach ( var location in locationList )
            {
                string temp = location.Name;
                condition = condition.Or( p => p.PostLocations.Any( pl => pl.Location.Name == temp ) );
            }

            return condition;
        }
    }
}
