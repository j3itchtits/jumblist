using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Core.Model
{
    [Table( Name = "LocationCategories" )]
    public partial class LocationCategory
    {
        private EntitySet<Location> locations = new EntitySet<Location>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int LocationCategoryId { get; set; }

        [Column( Name = "LocationCategoryName" )]
        public string Name { get; set; }

        [Association( Name = "FK_Locations_LocationCategories", Storage = "feeds", ThisKey = "LocationCategoryId", OtherKey = "LocationCategoryId", IsForeignKey = true )]
        public EntitySet<Location> Locations
        {
            get { return locations; }
            set { locations.Assign( value ); }
        }
    }
}
