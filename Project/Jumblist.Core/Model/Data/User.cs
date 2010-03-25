using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;
using StuartClode.Mvc.Extension;
using System.Runtime.Serialization;

namespace Jumblist.Core.Model
{
    [Table( Name = "Users" )]
    [DataContract( IsReference=false )]
    public partial class User
    {
        private EntityRef<Role> role;
        private EntitySet<Post> posts = new EntitySet<Post>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int UserId { get; set; }

        [Column( Name = "UserName" )]
        [DataMember]
        [Required]
        [StringLength( 50 )]
        public string Name { get; set; }

        [Column( Name = "UserEmail" )]
        [DataMember]
        [Required]
        [RegularExpression( StringExtensions.EmailOnlyRegex, ErrorMessage = "You must supply a valid email address" )]
        [StringLength( 250 )]
        public string Email { get; set; }

        [Column( Name = "UserPassword" )]
        [Required]
        [StringLength( 50 )]
        [RegularExpression( StringExtensions.PasswordOnlyRegex, ErrorMessage = "Your password must be between 6 and 50 characters in length and not contain any spaces" )]
        public string Password { get; set; }

        [Column( Name = "UserPostcode" )]
        [DataMember]
        [RegularExpression( StringExtensions.UKPostcodeOnlyRegex, ErrorMessage = "You must supply a valid UK postcode" )]
        public string Postcode { get; set; }

        [Column(Name = "UserLatitude")]
        [DataMember]
        public double Latitude { get; set; }

        [Column(Name = "UserLongitude")]
        [DataMember]
        public double Longitude { get; set; }

        [Column(Name = "UserSearchRadiusMiles")]
        [DataMember]
        [Required]
        public int SearchRadiusMiles { get; set; }

        [Column( Name = "UserIsActive" )]
        [DataMember]
        public bool IsActive { get; set; }

        [Column( Name = "UserDateCreated" )]
        [DataMember]
        [Required]
        [DataType( DataType.DateTime )]
        public DateTime DateCreated { get; set; }

        [Column( Name = "RoleId" )]
        [DataMember]
        [Required]
        public int RoleId { get; set; }

        [Association( Name = "FK_Users_Roles", Storage = "role", ThisKey = "RoleId", OtherKey = "RoleId", IsForeignKey = true )]
        [DataMember]
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
