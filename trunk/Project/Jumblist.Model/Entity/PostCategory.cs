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
        private EntitySet<Post> posts = new EntitySet<Post>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int PostCategoryId { get; set; }

        [Column( Name = "PostCategoryName" )]
        public string Name { get; set; }

        [Association( Name = "FK_Posts_PostCategories", Storage = "posts", ThisKey = "PostCategoryId", OtherKey = "CategoryId", IsForeignKey = true )]
        public IQueryable<Post> Posts
        {
            get { return posts.AsQueryable<Post>(); }
        }

    }
}
