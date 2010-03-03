using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Linq.Expressions;

namespace Jumblist.Core.Model
{
    public partial class Feed
    {
        public static Expression<Func<Feed, bool>> Duplicate(string url)
        {
            return x => x.Url == url;
        }
    }
}
