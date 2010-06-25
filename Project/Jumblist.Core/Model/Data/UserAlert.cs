using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;
using StuartClode.Mvc.Extension;
using Jumblist.Core.Model.Validation;
using Jumblist.Core.Service;

namespace Jumblist.Core.Model
{
    [Table( Name = "UserAlerts" )]
    public partial class UserAlert
    {
        private EntityRef<User> user;

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int UserAlertId { get; set; }

        [Column( Name = "UserId" )]
        [Required]
        public int UserId { get; set; }

        [Column( Name = "UserAlertName" )]
        [Required]
        [StringLength( 250 )]
        public string Name { get; set; }

        [Column( Name = "UserAlertPostListRouteValues" )]
        [Required]
        public string PostListRouteValues { get; set; }

        [Column( Name = "UserAlertIsImmediateSend" )]
        public bool IsImmediateSend { get; set; }

        [Column( Name = "UserAlertTimetoSend" )]
        [Range( 0, 23 )]
        public int TimetoSend { get; set; }

        [Column( Name = "UserAlertDateTimeLastSent" )]
        [DataType( DataType.DateTime )]
        public DateTime DateTimeLastSent { get; set; }

        [Column( Name = "UserAlertIsActive" )]
        public bool IsActive { get; set; }

        [Column( Name = "UserAlertDateTimeCreated" )]
        [DataType( DataType.DateTime )]
        public DateTime DateTimeCreated { get; set; }

        [Association( Name = "FK_UserAlerts_Users", Storage = "user", ThisKey = "UserId", OtherKey = "UserId", IsForeignKey = true )]
        public User User
        {
            get { return user.Entity; }
            set { user.Entity = value; } 
        }
    }
}
