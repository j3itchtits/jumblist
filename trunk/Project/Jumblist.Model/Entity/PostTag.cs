using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Jumblist.Model.Entity
{
    [Table(Name = "PostTags")]
    public class PostTag
    {
        [Column]
        public int PostId { get; set; }

        [Column]
        public int TagId { get; set; }
    }
}
