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
        [Column( IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert )]
        public int TagCategoryId { get; internal set; }

        [Column( Name = "TagCategoryName" )]
        public string Name { get; set; }

        private EntitySet<Tag> tags = new EntitySet<Tag>();
        [Association( Name = "FK_Tags_TagCategories", Storage = "tags", ThisKey = "TagCategoryId", OtherKey = "TagCategoryId", IsForeignKey = true )]
        public IList<Tag> Tags
        {
            get { return tags.ToList().AsReadOnly(); }
        }

    }
}
