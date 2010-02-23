using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;

namespace Jumblist.Core.Model
{
    [Table(Name = "FeedLocations")]
    public class FeedLocation
    {
        private EntityRef<Feed> feed;
        private EntityRef<Location> location;

        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int Id { get; set; }

        [Column]
        [Required]
        public int FeedId { get; set; }

        [Column]
        [Required]
        public int LocationId { get; set; }

        [Association(Name = "FK_FeedLocations_Feeds", Storage = "feed", ThisKey = "FeedId", OtherKey = "FeedId", IsForeignKey = true, DeleteOnNull = true)]
        public Feed Feed
        {
            get { return feed.Entity; }
            set { feed.Entity = value; }
        }

        [Association(Name = "FK_FeedLocations_Locations", Storage = "location", ThisKey = "LocationId", OtherKey = "LocationId", IsForeignKey = true, DeleteOnNull = true)]
        public Location Location
        {
            get { return location.Entity; }
            set { location.Entity = value; }
        }
    }
}
