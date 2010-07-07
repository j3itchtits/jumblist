using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Linq.Expressions;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Service.Data;

namespace Jumblist.Core.Model
{
    public partial class PostCategory
    {

        public static Expression<Func<PostCategory, bool>> WhereNameEquals( string postCategoryName )
        {
            return x => x.Name == postCategoryName;
        }

        public static Expression<Func<PostCategory, bool>> WhereIsNavigationEquals( bool isNavigation )
        {
            return x => x.IsNavigation == isNavigation;
        }

        public string SelectListValue { get; set; }
    }

    public enum PostCategoryId
    {
        Offered = 1,
        Wanted = 2,
        Taken = 3,
        Unclassified = 4,
        Received = 5
    }
}
