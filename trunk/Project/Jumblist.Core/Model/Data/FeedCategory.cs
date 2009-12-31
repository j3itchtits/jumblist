using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace JumblistTest.Core.Model
{
    [Table( Name = "FeedCategories" )]
    public class FeedCategory
    {
        private EntitySet<Feed> feeds = new EntitySet<Feed>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int FeedCategoryId { get; set; }

        [Column( Name = "FeedCategoryName" )]
        public string Name { get; set; }

        [Association( Name = "FK_Feeds_FeedCategories", Storage = "feeds", ThisKey = "FeedCategoryId", OtherKey = "FeedCategoryId", IsForeignKey = true )]
        public EntitySet<Feed> Feeds
        {
            get { return feeds; }
            set { feeds.Assign( value ); }
        }
    }
}
