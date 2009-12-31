using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

namespace JumblistTest.Core.Model
{
    public partial class Location
    {
        public IList<Post> Posts
        {
            get { return postLocations.Select( p => p.Post ).ToList().AsReadOnly(); }
        }
    }
}
