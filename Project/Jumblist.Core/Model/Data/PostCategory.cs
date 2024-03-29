﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;

namespace Jumblist.Core.Model
{
    [Table( Name = "PostCategories" )]
    public partial class PostCategory
    {
        private EntitySet<Post> posts = new EntitySet<Post>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int PostCategoryId { get; set; }

        [Column( Name = "PostCategoryName" )]
        [Required( ErrorMessage = "Please enter a name" )]
        [StringLength( 250 )]
        public string Name { get; set; }

        [Column( Name = "PostCategoryAlternativeSearchText" )]
        [Required( ErrorMessage = "Please enter an alternative search string" )]
        [StringLength( 250 )]
        public string AlternativeSearchText { get; set; }

        [Column( Name = "PostCategoryIsNavigation" )]
        public bool IsNavigation { get; set; }

        [Association( Name = "FK_Posts_PostCategories", Storage = "posts", ThisKey = "PostCategoryId", OtherKey = "PostCategoryId", IsForeignKey = true )]
        public EntitySet<Post> Posts
        {
            get { return posts; }
            set { posts.Assign( value ); }
        }
    }
}
