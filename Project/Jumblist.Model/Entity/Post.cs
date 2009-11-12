using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table( Name = "Posts" )]
    public class Post
    {
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int PostId { get; internal set; }

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
        internal int PostCategoryId { get; set; }

        [Column( Name = "AuthorId" )]
        internal int AuthorId { get; set; }

        [Column( Name = "FeedId" )]
        internal int FeedId { get; set; }

        internal EntityRef<PostCategory> postCategory;
        [Association( Name = "FK_Posts_PostCategories", Storage = "postCategory", ThisKey = "PostCategoryId", OtherKey = "PostCategoryId", IsForeignKey = true )]
        public PostCategory Category
        {
            get { return postCategory.Entity; }
            internal set { postCategory.Entity = value; PostCategoryId = value.PostCategoryId; }
        }

        internal EntityRef<Author> author;
        [Association( Name = "FK_Posts_Authors", Storage = "author", ThisKey = "AuthorId", OtherKey = "AuthorId", IsForeignKey = true )]
        public Author Author
        {
            get { return author.Entity; }
            internal set { author.Entity = value; AuthorId = value.AuthorId; }
        }

        internal EntityRef<Feed> feed;
        [Association( Name = "FK_Posts_Feed", Storage = "feed", ThisKey = "FeedId", OtherKey = "FeedId", IsForeignKey = true )]
        public Feed Feed
        {
            get { return feed.Entity; }
            internal set { feed.Entity = value; FeedId = value.FeedId; }
        }

        private EntitySet<PostLocation> postLocations = new EntitySet<PostLocation>();
        [Association( Name = "FK_PostLocations_Posts", Storage = "postLocations", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true )]
        public IList<PostLocation> PostLocations
        {
            get { return postLocations.ToList().AsReadOnly(); }
        }

        private EntitySet<Location> locations = new EntitySet<Location>();
        public IList<Location> Locations
        {
            get { return PostLocations.Select( l => l.Location ).ToList().AsReadOnly(); }
        }

        private EntitySet<PostTag> postTags = new EntitySet<PostTag>();
        [Association( Name = "FK_PostTags_Posts", Storage = "postTags", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true )]
        public IList<PostTag> PostTags
        {
            get { return postTags.ToList().AsReadOnly(); }
        }

        private EntitySet<Tag> tags = new EntitySet<Tag>();
        public IList<Tag> Tags
        {
            get { return PostTags.Select( t => t.Tag ).ToList().AsReadOnly(); }
        }
    }
}
