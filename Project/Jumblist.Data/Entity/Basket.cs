using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Data.Entity
{
    public class Basket
    {
        private List<Post> items = new List<Post>();
        public IList<Post> Items { get { return items.AsReadOnly(); } }

        private BasketUser basketUser = new BasketUser();
        public BasketUser BasketUser { get { return basketUser; } }

        public void AddItem( Post post )
        {
            var first = items.FirstOrDefault( p => p.PostId == post.PostId );
            if (first == null)
                items.Add( post );
        }

        public void ClearItem( Post post )
        {
            items.RemoveAll(p => p.PostId == post.PostId );
        }

        public void ClearAll()
        {
            items.Clear();
        }
    }
}
