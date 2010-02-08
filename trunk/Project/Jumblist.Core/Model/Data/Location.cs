using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;

namespace Jumblist.Core.Model
{
    [Table(Name = "Locations")]
    public partial class Location
    {
        private EntityRef<LocationCategory> locationCategory;
        private EntitySet<PostLocation> postLocations = new EntitySet<PostLocation>();

        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int LocationId { get; set; }

        [Column( Name = "LocationParentId" )]
        public int? ParentId { get; set; }

        [Column( Name = "LocationName" )]
        [Required]
        [StringLength( 250 )]
        public string Name { get; set; }

        [Column( Name = "LocationFriendlyUrl" )]
        [Required]
        [StringLength( 250 )]
        public string FriendlyUrl { get; set; }

        [Column( Name = "LocationCategoryId" )]
        [Required]
        public int LocationCategoryId { get; set; }

        [Association( Name = "FK_Locations_LocationCategories", Storage = "locationCategory", ThisKey = "LocationCategoryId", OtherKey = "LocationCategoryId", IsForeignKey = true )]
        public LocationCategory Category
        {
            get { return locationCategory.Entity; }
            set { locationCategory.Entity = value; } //LocationCategoryId = value.LocationCategoryId; }
        }

        [Association(Name = "FK_PostLocations_Locations", Storage = "postLocations", ThisKey = "LocationId", OtherKey = "LocationId", IsForeignKey = true)]
        public EntitySet<PostLocation> PostLocations
        {
            get { return postLocations; }
            set { postLocations.Assign( value ); }
        }
    }
}
