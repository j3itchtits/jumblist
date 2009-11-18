using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Data.Entity
{
    [Table(Name = "Tags")]
    public class Tag
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int TagId { get; internal set; }

        [Column(Name = "TagParentId")]
        public int ParentId { get; set; }

        [Column(Name = "TagName")]
        public string Name { get; set; }

        private EntitySet<PostTag> postTags = new EntitySet<PostTag>();
        [Association(Name = "FK_PostTags_Tags", Storage = "postTags", ThisKey = "TagId", OtherKey = "TagId", IsForeignKey = true)]
        public IList<PostTag> PostTags
        {
            get { return postTags.ToList().AsReadOnly(); }
        }

        private EntitySet<Post> posts = new EntitySet<Post>();
        public IList<Post> Posts
        {
            get { return PostTags.Select( p => p.Post ).ToList().AsReadOnly(); }
        }
    }
}
