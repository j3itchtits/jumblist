using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Jumblist.Model.Entity
{
    [Table(Name="Posts")]
    public class Post
    {
        [Column( IsPrimaryKey=true, IsDbGenerated=true, AutoSync=AutoSync.OnInsert )]
        public int PostId { get; set; }

        [Column( Name="PostParentId") ]
        public int ParentId { get; set; }

        [Column( Name = "PostUrl" )]
        public string Url { get; set; }

        [Column( Name = "PostTitle" )]
        public string Title { get; set; }

        [Column( Name = "PostBody" )]
        public string Body { get; set; }

        [Column( Name = "PostDateTime" )]
        public DateTime DateTime { get; set; }

        [Column( Name = "PostCategoryId" )]
        public int CategoryId { get; set; }

        [Column( Name = "PostLatitude" )]
        public double Latitude { get; set; }

        [Column( Name = "PostLongitude" )]
        public double Longitude { get; set; }

        [Column( Name = "PostDisplay" )]
        public bool Display { get; set; }

        [Column]
        public int AuthorId { get; set; }

        [Column]
        public int FeedId { get; set; }
    }
}
