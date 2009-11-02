using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Jumblist.Model.Entity
{
    [Table( Name = "Feeds" )]
    public class Feed
    {
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int FeedId { get; set; }

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

    }
}
