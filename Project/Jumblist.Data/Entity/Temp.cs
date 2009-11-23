using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Jumblist.Data.Entity
{
    [Table( Name = "Temp" )]
    public class Temp
    {
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int TempId { get; set; }

        [Column( Name = "TempParentId" )]
        public int ParentId { get; set; }

        [Column( Name = "TempName" )]
        public string Name { get; set; }
    }
}
