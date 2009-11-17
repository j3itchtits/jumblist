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
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int AuthorId { get; internal set; }

        [Column( Name = "AuthorName" )]
        public string Name { get; set; }

        [Column( Name = "AuthorProfile" )]
        public string Profile { get; set; }

        [Column( Name = "AuthorEmailHttpLink" )]
        public string EmailHttpLink { get; set; }

        private EntitySet<Post> posts = new EntitySet<Post>();
        [Association(Name = "FK_Posts_Authors", Storage = "posts", ThisKey = "AuthorId", OtherKey = "AuthorId", IsForeignKey = true)]
        public IList<Post> Posts
        {
            get { return posts.ToList().AsReadOnly(); }
        }


    }
}
