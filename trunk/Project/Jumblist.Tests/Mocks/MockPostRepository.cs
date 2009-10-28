using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Moq;
using Jumblist.Model.Abstract;
using Jumblist.Model.Entity;

namespace Jumblist.Tests.Mocks
{
    public class MockPostRepository
    {
        private List<Post> postList;
        private IPostRepository postRepository;

        public MockPostRepository()
        {
            postList = GenerateListOfPosts();
            postRepository = GenerateMockPostRepository( postList );
        }

        public MockPostRepository( List<Post> postList )
        {
            postRepository = GenerateMockPostRepository( postList );
        }

        public IPostRepository Repository
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

        private IPostRepository GenerateMockPostRepository( List<Post> posts )
        {
            var mockRepository = new Mock<IPostRepository>();
            mockRepository.Setup( x => x.SelectPosts() ).Returns( posts.AsQueryable() );
            return mockRepository.Object;
        }
    }
}
