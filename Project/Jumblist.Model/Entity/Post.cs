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
        [Column(IsPrimaryKey=true,IsDbGenerated=true,AutoSync=AutoSync.OnInsert)]
        public int PostId { get; set; }

        [Column]
        public int PostParentId { get; set; }

        [Column]
        public string PostUrl { get; set; }

        [Column]
        public string PostTitle { get; set; }

        //[Column]
        //public string PostBody { get; set; }

        //[Column]
        //public DateTime PostDateTime { get; set; }

        //[Column]
        //public float PostLatitude { get; set; }

        //[Column]
        //public float PostLongitude { get; set; }

        //[Column]
        //public bool PostDisplay { get; set; }
    }
}
