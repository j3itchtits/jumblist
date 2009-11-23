using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Data.Entity
{
    [Table(Name = "Locations")]
    public class Location
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int LocationId { get; set; }

        [Column( Name = "LocationParentId" )]
        public int? ParentId { get; set; }

        [Column( Name = "LocationName" )]
        public string Name { get; set; }

        [Column( Name = "LocationCategoryId" )]
        internal int LocationCategoryId { get; set; }

        internal EntityRef<LocationCategory> locationCategory;
        [Association( Name = "FK_Locations_LocationCategories", Storage = "locationCategory", ThisKey = "LocationCategoryId", OtherKey = "LocationCategoryId", IsForeignKey = true )]
        public LocationCategory Category
        {
            get { return locationCategory.Entity; }
            internal set { locationCategory.Entity = value; LocationCategoryId = value.LocationCategoryId; }
        }

        private EntitySet<PostLocation> postLocations = new EntitySet<PostLocation>();
        [Association(Name = "FK_PostLocations_Locations", Storage = "postLocations", ThisKey = "LocationId", OtherKey = "LocationId", IsForeignKey = true)]
        public IList<PostLocation> PostLocations
        {
            get { return postLocations.ToList().AsReadOnly(); }
        }

        private EntitySet<Post> posts = new EntitySet<Post>();
        public IList<Post> Posts
        {
            get { return PostLocations.Select( p => p.Post ).ToList().AsReadOnly(); }
        }
    }
}
