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
        public int Id { get; set; }

        [Column]
        public int ParentId { get; set; }

        [Column]
        public string Url { get; set; }

        [Column]
        public string Title { get; set; }

        [Column]
        public string Body { get; set; }

        [Column]
        public DateTime DateTime { get; set; }

        [Column]
        public double Latitude { get; set; }

        [Column]
        public double Longitude { get; set; }

        [Column]
        public bool Display { get; set; }
    }
}
