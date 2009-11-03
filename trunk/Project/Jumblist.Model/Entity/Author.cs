using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table( Name = "Authors" )]
    public class Author
    {
        private EntitySet<Post> posts = new EntitySet<Post>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int AuthorId { get; set; }

        [Column( Name = "AuthorName" )]
        public string Name { get; set; }

        [Column( Name = "AuthorProfile" )]
        public string Profile { get; set; }

        [Column( Name = "AuthorEmailHttpLink" )]
        public string EmailHttpLink { get; set; }

        [Association(Name = "FK_Posts_Authors", Storage = "posts", ThisKey = "AuthorId", OtherKey = "AuthorId", IsForeignKey = true)]
        public IQueryable<Post> Posts
        {
            get { return posts.AsQueryable<Post>(); }
        }
    }
}
