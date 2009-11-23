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
        public int TagId { get; set; }

        [Column(Name = "TagParentId")]
        public int ParentId { get; set; }

        [Column(Name = "TagName")]
        public string Name { get; set; }

        private EntitySet<PostTag> postTags = new EntitySet<PostTag>();
        [Association( Name = "FK_PostTags_Tags", Storage = "postTags", ThisKey = "TagId", OtherKey = "TagId", IsForeignKey = true )]
        public EntitySet<PostTag> PostTags
        {
            get
            {
                return postTags;
            }
            set
            {
                postTags.Assign( value );
            }
        }


        public IList<Post> Posts
        {
            get { return PostTags.Select( p => p.Post ).ToList().AsReadOnly(); }
        }
    }
}
