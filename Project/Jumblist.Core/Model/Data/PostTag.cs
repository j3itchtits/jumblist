using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace JumblistTest.Core.Model
{
    [Table(Name = "PostTags")]
    public class PostTag
    {
        private EntityRef<Post> post;
        private EntityRef<Tag> tag;

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int Id { get; set; }

        [Column]
        public int PostId { get; set; }

        [Column]
        public int TagId { get; set; }

        [Association( Name = "FK_PostTags_Posts", Storage = "post", ThisKey = "PostId", OtherKey = "PostId", IsForeignKey = true, DeleteOnNull = true )]
        public Post Post
        {
            get { return post.Entity; }
            set { post.Entity = value; PostId = value.PostId; }
        }

        [Association( Name = "FK_PostTags_Tags", Storage = "tag", ThisKey = "TagId", OtherKey = "TagId", IsForeignKey = true, DeleteOnNull = true )]
        public Tag Tag
        {
            get { return tag.Entity; }
            set { tag.Entity = value; TagId = value.TagId; }
        }
    }
}
