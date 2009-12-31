using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Moq;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service;

namespace Jumblist.Tests.Mocks
{
    public class MockPostRepository
    {
        private List<Post> postList;
        private IDataService<Post> postRepository;

        public MockPostRepository()
        {
            postList = GenerateListOfPosts();
            postRepository = GenerateMockPostRepository( postList );
        }

        public MockPostRepository( List<Post> postList )
        {
            postRepository = GenerateMockPostRepository( postList );
        }

        public IDataService<Post> Repository
        {
            get { return postRepository; }
        }

        private List<Post> GenerateListOfPosts()
        {
            return new List<Post>() { 
                new Post { Title = "Wanted: Socks" },
                new Post { Title = "Offered: Linen" },
                new Post { Title = "Wanted: Bricks" },
                new Post { Title = "Wanted: Fridge" },
                new Post { Title = "Taken: Socks" }
            };
        }

        private IDataService<Post> GenerateMockPostRepository( List<Post> posts )
        {
            var mockRepository = new Mock<IDataService<Post>>();
            mockRepository.Setup( x => x.SelectList() ).Returns( posts.AsQueryable() );
            return mockRepository.Object;
        }
    }
}
