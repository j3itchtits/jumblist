using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Data.Entity
{
    [Table( Name = "FeedCategories" )]
    public class FeedCategory
    {
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int FeedCategoryId { get; internal set; }

        [Column( Name = "FeedCategoryName" )]
        public string Name { get; set; }

        private EntitySet<Feed> feeds = new EntitySet<Feed>();
        [Association( Name = "FK_Feeds_FeedCategories", Storage = "feeds", ThisKey = "FeedCategoryId", OtherKey = "FeedCategoryId", IsForeignKey = true )]
        public IList<Feed> Feeds
        {
            get { return feeds.ToList().AsReadOnly(); }
        }
    }
}
