using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Abstract;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Repository
{
    public class FakePostRepository : IPostRepository
    {

        #region IPostRepository Members

        public IQueryable<Post> PostList
        {
            get { return FakePosts(); }
        }

        private IQueryable<Post> FakePosts()
        {
            return new List<Post> { 
                new Post { PostTitle = "First Post", PostUrl = "http://www.jumblist.com/first" },
                new Post { PostTitle = "Second Post", PostUrl = "http://www.jumblist.com/second" },
                new Post { PostTitle = "Third Post", PostUrl = "http://www.jumblist.com/thrid" }
            }.AsQueryable();
        }

        #endregion
    }
}
