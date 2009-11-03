using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table(Name = "Locations")]
    public class Location
    {
        private EntityRef<LocationCategory> locationCategory;
        private EntitySet<PostLocation> postLocations = new EntitySet<PostLocation>();

        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int LocationId { get; set; }

        [Column( Name = "LocationParentId" )]
        public int? ParentId { get; set; }

        [Column( Name = "LocationName" )]
        public string Name { get; set; }

        [Column( Name = "LocationCategoryId" )]
        public int CategoryId { get; set; }

        [Association( Name = "FK_Locations_LocationCategories", Storage = "locationCategory", ThisKey = "CategoryId", OtherKey = "LocationCategoryId", IsForeignKey = true )]
        public LocationCategory Category
        {
            get { return locationCategory.Entity; }
        }

        [Association(Name = "FK_PostLocations_Locations", Storage = "postLocations", ThisKey = "LocationId", OtherKey = "LocationId", IsForeignKey = true)]
        public IQueryable<PostLocation> PostLocations
        {
            get { return postLocations.AsQueryable<PostLocation>(); }
        }
    }
}
