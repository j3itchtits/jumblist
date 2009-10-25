using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Model.Entity
{
    public class Post
    {
        public int PostId { get; set; }
        public int PostParentId { get; set; }
        public string PostUrl { get; set; }
        public string PostTitle { get; set; }
        //public string PostBody { get; set; }
        //public DateTime PostDateTime { get; set; }
        //public float PostLatitude { get; set; }
        //public float PostLongitude { get; set; }
        //public bool PostDisplay { get; set; }
    }
}
