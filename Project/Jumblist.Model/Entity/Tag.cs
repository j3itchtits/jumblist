using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Jumblist.Model.Entity
{
    [Table(Name = "Tags")]
    public class Tag
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int TagId { get; set; }

        [Column(Name = "TagParentId")]
        public int ParentId { get; set; }

        [Column(Name = "TagName")]
        public string Name { get; set; }
    }
}
