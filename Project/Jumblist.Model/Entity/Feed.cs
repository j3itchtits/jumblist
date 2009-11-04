using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table( Name = "Feeds" )]
    public class Feed
    {
        private EntityRef<FeedCategory> feedCategory;
        private EntitySet<Post> posts = new EntitySet<Post>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int FeedId { get; set; }

        [Column( Name = "FeedTitle" )]
        public string Title { get; set; }

        [Column( Name = "FeedTitleUrlEncoded" )]
        public string TitleUrlEncoded { get; set; }

        [Column( Name = "FeedUrl" )]
        public string Url { get; set; }

        [Column( Name = "FeedUsername" )]
        public string Username { get; set; }

        [Column( Name = "FeedPassword" )]
        public string Password { get; set; }

        [Column( Name = "FeedCheckIntervalTicks" )]
        public int CheckIntervalTicks { get; set; }

        [Column( Name = "FeedLastUpdateHttpStatus" )]
        public string LastUpdateHttpStatus { get; set; }

        [Column( Name = "FeedLastUpdateDateTime" )]
        public DateTime LastUpdateDateTime { get; set; }

        [Column( Name = "FeedCategoryId" )]
        public int CategoryId { get; set; }

        [Association(Name = "FK_Feeds_FeedCategories", Storage = "feedCategory", ThisKey = "CategoryId", OtherKey = "FeedCategoryId", IsForeignKey = true)]
        public FeedCategory Category
        {
            get { return feedCategory.Entity; }
        }

        [Association(Name = "FK_Posts_Feeds", Storage = "posts", ThisKey = "FeedId", OtherKey = "FeedId", IsForeignKey = true)]
        public IQueryable<Post> Posts
        {
            get { return posts.AsQueryable<Post>(); }
        }
    }
}
