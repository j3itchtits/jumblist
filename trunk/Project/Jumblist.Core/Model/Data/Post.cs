using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Core.Model
{
    [Table( Name = "Posts" )]
    public partial class Post
    {
        private EntityRef<PostCategory> postCategory;
        private EntityRef<User> user;
        private EntityRef<Feed> feed;
        private EntitySet<PostLocation> postLocations = new EntitySet<PostLocation>();
        private EntitySet<PostTag> postTags = new EntitySet<PostTag>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int PostId { get; set; }

        [Column( Name = "PostParentId" )]
        public int ParentId { get; set; }

        [Column( Name = "PostUrl" )]
        public string Url { get; set; }

        [Column( Name = "PostTitle" )]
        public string Title { get; set; }

        [Column( Name = "PostBody" )]
        public string Body { get; set; }

        [Column( Name = "PostDateTime" )]
        public DateTime DateTime { get; set; }

        [Column( Name = "PostLatitude" )]
        public double Latitude { get; set; }

        [Column( Name = "PostLongitude" )]
        public double Longitude { get; set; }

        [Column( Name = "PostDisplay" )]
        public bool Display { get; set; }

        [Column( Name = "PostCategoryId" )]
        public int PostCategoryId { get; set; }

        [Association( Name = "FK_Posts_PostCategories", Storage = "postCategory", ThisKey = "PostCategoryId", OtherKey = "PostCategoryId", IsForeignKey = true )]
        public PostCategory PostCategory
        {
            get { return postCategory.Entity; }
            set { postCategory.Entity = value; PostCategoryId = value.PostCategoryId; }
        }

        [Column( Name = "UserId" )]
        public int UserId { get; set; }

        [Association( Name = "FK_Posts_Users", Storage = "user", ThisKey = "UserId", OtherKey = "UserId", IsForeignKey = true )]
        public User User
        {
            get { return user.Entity; }
            set { user.Entity = value; UserId = value.UserId; }
        }

        [Column( Name = "FeedId" )]
        public int FeedId { get; set; }

        [Association( Name = "FK_Posts_Feed", Storage = "feed", ThisKey = "FeedId", OtherKey = "FeedId", IsForeignKey = true )]
        public Feed Feed
        {
            get { return feed.Entity; }
            set { feed.Entity = value; FeedId = value.FeedId; }
        }

        [Association( Name = "FK_PostLocations_Posts", Storage = "postLocations", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true )]
        public EntitySet<PostLocation> PostLocations
        {
            get { return postLocations; }
            set { postLocations.Assign( value ); }
        }

        [Association( Name = "FK_PostTags_Posts", Storage = "postTags", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true )]
        public EntitySet<PostTag> PostTags
        {
            get { return postTags; }
            set { postTags.Assign( value ); }
        }
    }
}
