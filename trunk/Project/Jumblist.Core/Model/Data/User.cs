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

        [Required, StringLength( 50 )]
        [Column( Name = "UserName" )]
        public string Name { get; set; }

        [Required, DataType( DataType.EmailAddress ), StringLength( 250 )]
        [Column( Name = "UserEmail" )]
        public string Email { get; set; }

        [Required, DataType( DataType.Password ), StringLength( 50 )]
        [Column( Name = "UserPassword" )]
        public string Password { get; set; }

        [RegularExpression( RegularExpressionString.UKPostcode, ErrorMessage="You must supply a valid UK postcode" )]
        [Column( Name = "UserPostcode" )]
        public string Postcode { get; set; }

        [Column( Name = "UserSearchRadiusMiles" )]
        public int SearchRadiusMiles { get; set; }

        [Column( Name = "UserLink" )]
        public string Link { get; set; }

        [Column( Name = "UserIsActive" )]
        public bool IsActive { get; set; }

        [Column( Name = "UserDateCreated" )]
        public DateTime DateCreated { get; set; }

        [Column( Name = "RoleId" )]
        public int RoleId { get; set; }

        [Association( Name = "FK_Users_Roles", Storage = "role", ThisKey = "RoleId", OtherKey = "RoleId", IsForeignKey = true )]
        public Role Role
        {
            get { return role.Entity; }
            set { role.Entity = value; RoleId = value.RoleId; }
        }

        [Association( Name = "FK_Posts_Authors", Storage = "posts", ThisKey = "UserId", OtherKey = "UserId", IsForeignKey = true )]
        public EntitySet<Post> Posts
        {
            get { return posts; }
            set { posts.Assign( value ); }
        }
    }
}
