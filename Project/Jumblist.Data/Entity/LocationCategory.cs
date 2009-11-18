using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Data.Entity
{
    [Table( Name = "LocationCategories" )]
    public class LocationCategory
    {
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int LocationCategoryId { get; internal set; }

        [Column( Name = "LocationCategoryName" )]
        public string Name { get; set; }

        private EntitySet<Location> locations = new EntitySet<Location>();
        [Association( Name = "FK_Locations_LocationCategories", Storage = "locations", ThisKey = "LocationCategoryId", OtherKey = "LocationCategoryId", IsForeignKey = true )]
        public IList<Location> Locations
        {
            get { return locations.ToList().AsReadOnly(); }
        }
    }
}
