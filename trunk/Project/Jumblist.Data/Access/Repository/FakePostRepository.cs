using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Model;

namespace Jumblist.Data.Access
{
    public class FakePostRepository
    {

        #region IPostRepository Members

        public IQueryable<Post> SelectPosts()
        {
            return FakePosts();
        }

        private IQueryable<Post> FakePosts()
        {
            return new List<Post> { 
                new Post { Title = "First Post", Url = "http://www.jumblist.com/first" },
                new Post { Title = "Second Post", Url = "http://www.jumblist.com/second" },
                new Post { Title = "Third Post", Url = "http://www.jumblist.com/thrid" }
            }.AsQueryable();
        }

        #endregion
    }
}
