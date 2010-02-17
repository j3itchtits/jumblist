using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;

namespace Jumblist.Core.Model
{
    [Table( Name = "FeedCategories" )]
    public partial class FeedCategory
    {
        private EntitySet<Feed> feeds = new EntitySet<Feed>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int FeedCategoryId { get; set; }

        [Column( Name = "FeedCategoryName" )]
        [Required( ErrorMessage = "Please enter a name" )]
        [StringLength( 250 )]
        public string Name { get; set; }

        [Column( Name = "FeedCategoryType" )]
        [Required( ErrorMessage = "Please enter a type" )]
        [StringLength( 50 )]
        public string Type { get; set; }

        [Association( Name = "FK_Feeds_FeedCategories", Storage = "feeds", ThisKey = "FeedCategoryId", OtherKey = "FeedCategoryId", IsForeignKey = true )]
        public EntitySet<Feed> Feeds
        {
            get { return feeds; }
            set { feeds.Assign( value ); }
        }
    }
}
