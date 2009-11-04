using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table(Name="Posts")]
    public class Post
    {
        private EntityRef<PostCategory> postCategory;
        private EntityRef<Author> author;
        private EntityRef<Feed> feed;
        private EntitySet<PostLocation> postLocations = new EntitySet<PostLocation>();
        private EntitySet<PostTag> postTags = new EntitySet<PostTag>();
        private EntitySet<Location> locations = new EntitySet<Location>();

        [Column( IsPrimaryKey=true, IsDbGenerated=true, AutoSync=AutoSync.OnInsert )]
        public int PostId { get; set; }

        [Column( Name="PostParentId") ]
        public int ParentId { get; set; }

        [Column( Name = "PostUrl" )]
        public string Url { get; set; }

        [Column( Name = "PostTitle" )]
        public string Title { get; set; }

        [Column( Name = "PostBody" )]
        public string Body { get; set; }

        [Column( Name = "PostDateTime" )]
        public DateTime DateTime { get; set; }

        [Column( Name = "PostCategoryId" )]
        public int CategoryId { get; set; }

        [Column( Name = "PostLatitude" )]
        public double Latitude { get; set; }

        [Column( Name = "PostLongitude" )]
        public double Longitude { get; set; }

        [Column( Name = "PostDisplay" )]
        public bool Display { get; set; }

        [Column]
        public int AuthorId { get; set; }

        [Column]
        public int FeedId { get; set; }

        [Association( Name = "FK_Posts_PostCategories", Storage = "postCategory", ThisKey = "CategoryId", OtherKey = "PostCategoryId", IsForeignKey = true )]
        public PostCategory Category
        {
            get { return postCategory.Entity; }
        }

        [Association(Name = "FK_Posts_Authors", Storage = "author", ThisKey = "AuthorId", OtherKey = "AuthorId", IsForeignKey = true)]
        public Author Author
        {
            get { return author.Entity; }
        }

        [Association(Name = "FK_Posts_Feed", Storage = "feed", ThisKey = "FeedId", OtherKey = "FeedId", IsForeignKey = true)]
        public Feed Feed
        {
            get { return feed.Entity; }
        }

        [Association(Name = "FK_PostLocations_Posts", Storage = "postLocations", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true)]
        public IQueryable<PostLocation> PostLocations
        {
            get { return postLocations.AsQueryable<PostLocation>(); }
        }

        [Association(Name = "FK_PostTags_Posts", Storage = "postTags", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true)]
        public IQueryable<PostTag> PostTags
        {
            get { return postTags.AsQueryable<PostTag>(); }
        }

        public IQueryable<Location> Locations
        {
            get { return locations.AsQueryable<Location>(); }
        }
    }
}
