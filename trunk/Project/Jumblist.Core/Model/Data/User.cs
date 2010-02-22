using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;
using StuartClode.Mvc.Helper;

namespace Jumblist.Core.Model
{
    [Table( Name = "Users" )]
    public partial class User
    {
        private EntityRef<Role> role;
        private EntitySet<Post> posts = new EntitySet<Post>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int UserId { get; set; }

        [Column( Name = "UserName" )]
        [Required]
        [StringLength( 50 )]
        public string Name { get; set; }

        [Column( Name = "UserEmail" )]
        [Required]
        [RegularExpression( RegularExpressionString.Email, ErrorMessage = "You must supply a valid email address" )]
        [StringLength( 250 )]
        public string Email { get; set; }

        [Column( Name = "UserPassword" )]
        [Required]
        [StringLength( 50 )]
        [RegularExpression( RegularExpressionString.Password, ErrorMessage = "Your password must be between 6 and 50 characters in length and not contain any spaces" )]
        public string Password { get; set; }

        [Column( Name = "UserPostcode" )]
        [RegularExpression( RegularExpressionString.UKPostcode, ErrorMessage = "You must supply a valid UK postcode" )]
        public string Postcode { get; set; }

        [Column(Name = "UserLatitude")]
        public double Latitude { get; set; }

        [Column(Name = "UserLongitude")]
        public double Longitude { get; set; }

        [Column(Name = "UserSearchRadiusMiles")]
        [Required]
        public int SearchRadiusMiles { get; set; }

        [Column( Name = "UserIsActive" )]
        public bool IsActive { get; set; }

        [Column( Name = "UserDateCreated" )]
        [Required]
        [DataType( DataType.DateTime )]
        public DateTime DateCreated { get; set; }

        [Column( Name = "RoleId" )]
        [Required]
        public int RoleId { get; set; }

        [Association( Name = "FK_Users_Roles", Storage = "role", ThisKey = "RoleId", OtherKey = "RoleId", IsForeignKey = true )]
        public Role Role
        {
            get { return role.Entity; }
            set { role.Entity = value; } //RoleId = value.RoleId; }
        }

        [Association( Name = "FK_Posts_Authors", Storage = "posts", ThisKey = "UserId", OtherKey = "UserId", IsForeignKey = true )]
        public EntitySet<Post> Posts
        {
            get { return posts; }
            set { posts.Assign( value ); }
        }
    }
}
