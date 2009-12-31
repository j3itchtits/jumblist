using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Core.Model
{
    [Table( Name = "Roles" )]
    public partial class Role
    {
        private EntitySet<User> users = new EntitySet<User>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int RoleId { get; set; }

        [Column( Name = "RoleLevel" )]
        public int Level { get; set; }

        [Column( Name = "RoleName" )]
        public string Name { get; set; }

        [Association( Name = "FK_Users_Roles", Storage = "users", ThisKey = "RoleId", OtherKey = "RoleId", IsForeignKey = true )]
        public EntitySet<User> Users
        {
            get { return users; }
            set { users.Assign( value ); }
        }
    }
}
