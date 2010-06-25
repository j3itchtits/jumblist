using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Core.Model
{
    [Serializable]
    public class PostListRouteValues
    {
        public string Action { get; set; }
        //public RouteValueDictionary RouteValues { get; set; }
        public string Id { get; set; }
        public string Category { get; set; }
        public string Q { get; set; }

        public void Update( string action, string q )
        {
            this.Action = action;
            this.Q = q;
        }

        public void Update( string action, string id, string q )
        {
            this.Action = action;
            this.Id = id;
            this.Q = q;
        }

        public void Update( string action, string id, string category, string q )
        {
            this.Action = action;
            this.Id = id;
            this.Category = category;
            this.Q = q;
        }
    }
}
