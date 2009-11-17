using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Data.Model
{
    [Table(Name = "PostLocations")]
    public class PostLocation
    {
        [Column( IsPrimaryKey = true )]
        public int PostId { get; internal set; }

        [Column( IsPrimaryKey = true )]
        public int LocationId { get; set; }

        private EntityRef<Post> post;
        [Association( Name = "FK_PostLocations_Posts", Storage = "post", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true, DeleteOnNull = true )]
        public Post Post
        {
            get { return post.Entity; }
        }

        private EntityRef<Location> location;
        [Association( Name = "FK_PostLocations_Locations", Storage = "location", ThisKey = "LocationId", OtherKey = "LocationId", IsForeignKey = true, DeleteOnNull = true )]
        public Location Location
        {
            get { return location.Entity; }
        }
    }
}
