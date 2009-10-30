using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Jumblist.Model.Entity
{
    [Table( Name = "LocationCategories" )]
    public class LocationCategory
    {
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int LocationCategoryId { get; set; }

        [Column( Name = "LocationCategoryName" )]
        public string Name { get; set; }
    }
}
