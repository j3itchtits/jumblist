using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Jumblist.Model.Entity
{
    [Table( Name = "Authors" )]
    public class Author
    {
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int AuthorId { get; set; }

        [Column( Name = "AuthorName" )]
        public int Name { get; set; }

        [Column( Name = "AuthorProfile" )]
        public string Profile { get; set; }

        [Column( Name = "AuthorEmailHttpLink" )]
        public string EmailHttpLink { get; set; }
        
    }
}
