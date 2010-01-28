﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;

namespace Jumblist.Core.Model
{
    [Table(Name = "Tags")]
    public partial class Tag
    {
        private EntitySet<PostTag> postTags = new EntitySet<PostTag>();

        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int TagId { get; set; }

        [Column(Name = "TagName")]
        [Required]
        [StringLength( 250 )]
        public string Name { get; set; }

        [Association( Name = "FK_PostTags_Tags", Storage = "postTags", ThisKey = "TagId", OtherKey = "TagId", IsForeignKey = true )]
        public EntitySet<PostTag> PostTags
        {
            get { return postTags; }
            set { postTags.Assign( value ); }
        }
    }
}
