using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table(Name = "PostLocations")]
    public class PostLocation
    {
        private EntityRef<Post> post;
        private EntityRef<Location> location;

        [Column( IsPrimaryKey = true )]
        public int PostId { get; set; }

        [Column( IsPrimaryKey = true )]
        public int LocationId { get; set; }

        [Association(Name = "FK_PostLocations_Posts", Storage = "post", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true)]
        public Post Post
        {
            get { return post.Entity; }
        }

        [Association(Name = "FK_PostLocations_Locations", Storage = "location", ThisKey = "LocationId", OtherKey = "LocationId", IsForeignKey = true)]
        public Location Location
        {
            get { return location.Entity; }
        }
    }
}
