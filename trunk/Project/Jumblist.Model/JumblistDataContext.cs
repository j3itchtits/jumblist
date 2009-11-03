using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Reflection;
using Jumblist.Model.Entity;

namespace Jumblist.Model
{
    public class JumblistDataContext : DataContext
    {

        public JumblistDataContext( string connectionString ) : 
				base(connectionString)
		{
		}

        public Table<Author> Authors
        {
            get
            {
                return GetTable<Author>();
            }
        }

        public Table<Feed> Feeds
        {
            get
            {
                return GetTable<Feed>();
            }
        }

        public Table<FeedCategory> FeedCategories
        {
            get
            {
                return GetTable<FeedCategory>();
            }
        }

        public Table<Location> Locations
        {
            get
            {
                return this.GetTable<Location>();
            }
        }

        public Table<LocationCategory> LocationCategories
        {
            get
            {
                return this.GetTable<LocationCategory>();
            }
        }

        public Table<Post> Posts
        {
            get
            {
                return GetTable<Post>();
            }
        }

        public Table<PostCategory> PostCategories
        {
            get
            {
                return this.GetTable<PostCategory>();
            }
        }

        public Table<PostTag> PostTags
        {
            get
            {
                return this.GetTable<PostTag>();
            }
        }

        public Table<PostLocation> PostLocations
        {
            get
            {
                return this.GetTable<PostLocation>();
            }
        }

        public Table<Tag> Tags
        {
            get
            {
                return this.GetTable<Tag>();
            }
        }

        public Table<TagCategory> TagCategories
        {
            get
            {
                return this.GetTable<TagCategory>();
            }
        }


        [Function(Name = "dbo.NearestPosts", IsComposable = true)]
        public IQueryable<NearestPostsResult> NearestPosts([Parameter(DbType = "Real")] System.Nullable<float> lat, [Parameter(Name = "long", DbType = "Real")] System.Nullable<float> @long, [Parameter(DbType = "Real")] System.Nullable<int> distance)
        {
            return this.CreateMethodCallQuery<NearestPostsResult>(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), lat, @long, distance);
        }

        [Function(Name = "dbo.DistanceBetween", IsComposable = true)]
        public System.Nullable<float> DistanceBetween([Parameter(Name = "Lat1", DbType = "Real")] System.Nullable<float> lat1, [Parameter(Name = "Long1", DbType = "Real")] System.Nullable<float> long1, [Parameter(Name = "Lat2", DbType = "Real")] System.Nullable<float> lat2, [Parameter(Name = "Long2", DbType = "Real")] System.Nullable<float> long2)
        {
            return ((System.Nullable<float>)(this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), lat1, long1, lat2, long2).ReturnValue));
        }
    }

    
}
