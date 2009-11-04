using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table(Name = "PostTags")]
    public class PostTag
    {
        private EntityRef<Post> post;
        private EntityRef<Tag> tag;

        [Column( IsPrimaryKey = true )]
        public int PostId { get; set; }

        [Column( IsPrimaryKey = true )]
        public int TagId { get; set; }

        [Association(Name = "FK_PostTags_Posts", Storage = "post", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true)]
        public Post Post
        {
            get { return post.Entity; }
        }

        [Association(Name = "FK_PostTags_Tags", Storage = "tag", ThisKey = "TagId", OtherKey = "TagId", IsForeignKey = true)]
        public Tag Tag
        {
            get { return tag.Entity; }
        }
    }
}
