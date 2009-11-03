using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Model.Entity
{
    [Table(Name = "Tags")]
    public class Tag
    {
        private EntityRef<TagCategory> tagCategory;
        private EntitySet<PostTag> postTags = new EntitySet<PostTag>();

        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int TagId { get; set; }

        [Column(Name = "TagParentId")]
        public int ParentId { get; set; }

        [Column(Name = "TagName")]
        public string Name { get; set; }

        [Column(Name = "TagCategoryId")]
        public int CategoryId { get; set; }

        [Association(Name = "FK_Tags_TagCategories", Storage = "tagCategory", ThisKey = "CategoryId", OtherKey = "TagCategoryId", IsForeignKey = true)]
        public TagCategory Category
        {
            get { return tagCategory.Entity; }
        }

        [Association(Name = "FK_PostTags_Tags", Storage = "postTags", ThisKey = "TagId", OtherKey = "TagId", IsForeignKey = true)]
        public IQueryable<PostTag> PostTags
        {
            get { return postTags.AsQueryable<PostTag>(); }
        }
    }
}
