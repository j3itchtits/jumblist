using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Core.Model
{
    public class JumblistSession
    {
        public Basket Basket { get; set; }
        public Location Location { get; set; }
        public int? PageSize { get; set; }
        public PostListRouteValues PostListRouteValues { get; set; }
    }


}
