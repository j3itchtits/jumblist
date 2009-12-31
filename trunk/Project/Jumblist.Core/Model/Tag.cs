using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace Jumblist.Core.Model
{
    public partial class Tag
    {
        public IList<Post> Posts
        {
            get { return postTags.Select( p => p.Post ).ToList().AsReadOnly(); }
        }

    }
}
