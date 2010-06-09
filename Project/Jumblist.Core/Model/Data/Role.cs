using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Jumblist.Core.Model
{
    [Table( Name = "Roles" )]
    [DataContract( IsReference = true )]
    public partial class Role
    {
        private EntitySet<User> users = new EntitySet<User>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int RoleId { get; set; }

        [Column( Name = "RoleLevel" )]
        [Required]
        [DataMember]
        public int Level { get; set; }

        [Column( Name = "RoleName" )]
        [Required( ErrorMessage = "Please enter a name" )]
        [StringLength( 250 )]
        [DataMember]
        public string Name { get; set; }

        [Association( Name = "FK_Users_Roles", Storage = "users", ThisKey = "RoleId", OtherKey = "RoleId", IsForeignKey = true )]
        public EntitySet<User> Users
        {
            get { return users; }
            set { users.Assign( value ); }
        }
    }
}
