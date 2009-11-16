using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Model.Entity
{
    public class Basket
    {
        public List<Post> items = new List<Post>();
        public IList<Post> Items 
        {
            get { return items.AsReadOnly(); } 
        }

        public void AddItem( Post post )
        {
            var first = items.FirstOrDefault( p => p.PostId == post.PostId );
            if (first == null)
            {
                items.Add( post );
            }
        }

        public void ClearItem( Post post )
        {
            items.Remove( post );
        }

        public void ClearAll()
        {
            items.Clear();
        }
    }
}
