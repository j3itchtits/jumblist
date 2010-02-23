using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;

namespace Jumblist.Core.Model
{
    [Table(Name = "PostLocations")]
    public class PostLocation
    {
        private EntityRef<Post> post;
        private EntityRef<Location> location;

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int Id { get; set; }

        [Column]
        [Required]
        public int PostId { get; set; }

        [Column]
        [Required]
        public int LocationId { get; set; }

        [Association( Name = "FK_PostLocations_Posts", Storage = "post", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true, DeleteOnNull = true )]
        public Post Post
        {
            get { return post.Entity; }
            set { post.Entity = value; }
        }

        [Association( Name = "FK_PostLocations_Locations", Storage = "location", ThisKey = "LocationId", OtherKey = "LocationId", IsForeignKey = true, DeleteOnNull = true )]
        public Location Location
        {
            get { return location.Entity; }
            set { location.Entity = value; }
        }
    }
}
