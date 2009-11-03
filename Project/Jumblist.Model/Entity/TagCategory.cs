using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table( Name = "TagCategories" )]
    public class TagCategory
    {
        private EntitySet<Tag> tags = new EntitySet<Tag>();

        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int TagCategoryId { get; set; }

        [Column( Name = "TagCategoryName" )]
        public string Name { get; set; }

        [Association(Name = "FK_Tags_TagCategories", Storage = "tags", ThisKey = "TagCategoryId", OtherKey = "CategoryId", IsForeignKey = true)]
        public IQueryable<Tag> Tags
        {
            get { return tags.AsQueryable<Tag>(); }
        }

    }
}
