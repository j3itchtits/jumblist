using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Data.Entity
{
    [Table(Name = "PostTags")]
    public class PostTag
    {
        [Column( IsPrimaryKey = true )]
        public int PostId { get; set; }

        [Column( IsPrimaryKey = true )]
        public int TagId { get; set; }

        private EntityRef<Post> post;
        [Association( Name = "FK_PostTags_Posts", Storage = "post", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true, DeleteOnNull = true )]
        public Post Post
        {
            get { return post.Entity; }
        }

        private EntityRef<Tag> tag;
        [Association( Name = "FK_PostTags_Tags", Storage = "tag", ThisKey = "TagId", OtherKey = "TagId", IsForeignKey = true, DeleteOnNull = true )]
        public Tag Tag
        {
            get { return tag.Entity; }
        }
    }
}
