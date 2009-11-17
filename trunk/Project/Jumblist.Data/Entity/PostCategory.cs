using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table( Name = "PostCategories" )]
    public class PostCategory
    {
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int PostCategoryId { get; internal set; }

        [Column( Name = "PostCategoryName" )]
        public string Name { get; set; }

        private EntitySet<Post> posts = new EntitySet<Post>();
        [Association( Name = "FK_Posts_PostCategories", Storage = "posts", ThisKey = "PostCategoryId", OtherKey = "PostCategoryId", IsForeignKey = true )]
        public IList<Post> Posts
        {
            get { return posts.ToList().AsReadOnly(); }
        }

    }
}
