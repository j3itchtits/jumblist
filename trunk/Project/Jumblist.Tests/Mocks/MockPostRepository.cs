using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Moq;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service.Data;
using Jumblist.Core.Service.Data;

namespace Jumblist.Tests.Mocks
{
    public class MockPostRepository
    {
        private List<Post> postList;
        private IPostService postRepository;

        public MockPostRepository()
        {
            postList = GenerateListOfPosts();
            postRepository = GenerateMockPostRepository( postList );
        }

        public MockPostRepository( List<Post> postList )
        {
            postRepository = GenerateMockPostRepository( postList );
        }

        public IPostService Repository
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

        private IPostService GenerateMockPostRepository( List<Post> posts )
        {
            var mockRepository = new Mock<IPostService>();
            mockRepository.Setup( x => x.SelectRecordList() ).Returns( posts.AsQueryable() );
            return mockRepository.Object;
        }
    }
}
