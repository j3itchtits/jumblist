using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;
using StuartClode.Mvc.Extension;
using Jumblist.Core.Model.Validation;
using Jumblist.Core.Service;

namespace Jumblist.Core.Model
{
    [Table( Name = "Feeds" )]
    public partial class Feed
    {
        private EntityRef<FeedCategory> feedCategory;
        private EntitySet<Post> posts = new EntitySet<Post>();
        private EntitySet<FeedLocation> feedLocations = new EntitySet<FeedLocation>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int FeedId { get; set; }

        [Column( Name = "FeedName" )]
        [Required(ErrorMessage="Please enter a title")]
        [StringLength(250)]
        public string Name { get; set; }

        [Column(Name = "FeedFriendlyUrl")]
        [Required]
        [StringLength(250)]
        public string FriendlyUrl { get; set; }

        [Column( Name = "FeedUrl" )]
        [Required( ErrorMessage = "Please enter a url" )]
        [StringLength( 500 )]
        [RegularExpression( StringExtensions.Url, ErrorMessage = "You must supply a valid url" )]
        public string Url { get; set; }

        [Column( Name = "FeedUsername" )]
        [StringLength( 250 )]
        //[Price( MinPrice = 1.99 )]
        public string Username { get; set; }

        [Column( Name = "FeedPassword" )]
        [StringLength( 250 )]
        public string Password { get; set; }

        [Column( Name = "FeedCheckIntervalTicks" )]
        [Required]
        [Range(5000,100000)]
        public int CheckIntervalTicks { get; set; }

        [Column( Name = "FeedLastUpdateHttpStatus" )]
        [StringLength( 3 )]
        public string LastUpdateHttpStatus { get; set; }

        [Column( Name = "FeedLastUpdateDateTime" )]
        [DataType( DataType.DateTime )]
        public DateTime LastUpdateDateTime { get; set; }

        [Column( Name = "FeedCategoryId" )]
        [Required]
        public int FeedCategoryId { get; set; }

        [Column( Name = "FeedIsActive" )]
        public bool IsActive { get; set; }

        [Association( Name = "FK_Feeds_FeedCategories", Storage = "feedCategory", ThisKey = "FeedCategoryId", OtherKey = "FeedCategoryId", IsForeignKey = true )]
        public FeedCategory Category
        {
            get { return feedCategory.Entity; }
            set { feedCategory.Entity = value; } //FeedCategoryId = value.FeedCategoryId; }
        }

        [Association( Name = "FK_Posts_Feeds", Storage = "posts", ThisKey = "FeedId", OtherKey = "FeedId", IsForeignKey = true )]
        public EntitySet<Post> Posts
        {
            get { return posts; }
            set { posts.Assign( value ); }
        }

        [Association(Name = "FK_FeedLocations_Feeds", Storage = "feedLocations", ThisKey = "FeedId", OtherKey = "FeedId", IsForeignKey = true)]
        public EntitySet<FeedLocation> FeedLocations
        {
            get { return feedLocations; }
            set { feedLocations.Assign(value); }
        }
    }
}
