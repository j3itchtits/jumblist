using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Model.Entity
{
    public class Basket
    {
        public List<Post> posts = new List<Post>();
        public IList<Post> Posts 
        { 
            get { return posts.AsReadOnly(); } 
        }

        public void AddPost( Post post )
        {
            var post = posts.FirstOrDefault( p => p.PostId == post.PostId );
        }

        public void ClearPost( Post post )
        {

        }

        public void ClearAll()
        {
        }
    }
}
