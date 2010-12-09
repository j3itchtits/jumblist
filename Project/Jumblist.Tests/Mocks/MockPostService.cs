using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Moq;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service.Data;

namespace Jumblist.Tests.Mocks
{
    public class MockPostService
    {
        private List<Post> postList;
        private IPostService postService;

        public MockPostService()
        {
            postList = GenerateListOfPosts();
            postService = GenerateMockPostService( postList );
        }

        public MockPostService( List<Post> postList )
        {
            postService = GenerateMockPostService( postList );
        }

        public IPostService Service
        {
            get { return postService; }
        }

        private List<Post> GenerateListOfPosts()
        {
            return new List<Post>() { 
                new Post { Url = "http://groups.yahoo.com/group/BexhillFreegle/message/15970?l=1", Title = "Offered - Canon PowerShot G11 Miscellany - Bexhill", Body = "", Latitude = 50.84496662, Longitude = 0.460397154, PostCategoryId = 1, NumberofViews = 3, Display = true, UserId = 15, FeedId = 5},
                new Post { Url = "http://groups.yahoo.com/group/hastings-freecycle/message/45692?l=1", Title = "offered - carpet, underlay and gripper strips", Body = "", Latitude = 50.8573342859745, Longitude = 0.591270849108696, PostCategoryId = 1, NumberofViews = 5, Display = true, UserId = 15, FeedId = 1},
                new Post { Url = "http://groups.yahoo.com/group/hastings-freecycle/message/45691?l=1", Title = "offered three bags of hangers", Body = "", Latitude = 50.85612327, Longitude = 0.578795224, PostCategoryId = 2, NumberofViews = 0, Display = false, UserId = 15, FeedId = 1},
                new Post { Url = "http://groups.yahoo.com/group/hastings-freecycle/message/45690?l=1", Title = "Wanted: cement, sand, ballast Ore area", Body = "", Latitude = 50.87010026, Longitude = 0.611899719, PostCategoryId = 2, NumberofViews = 234, Display = true, UserId = 15, FeedId = 1},
                new Post { Url = "http://groups.yahoo.com/group/hastings-freecycle/message/45689?l=1", Title = "Offered-Blacklands-Planters", Body = "", Latitude = 50.86804558, Longitude = 0.581656989, PostCategoryId = 2, NumberofViews = 23, Display = true, UserId = 15, FeedId = 1},
                new Post { Url = "http://groups.yahoo.com/group/hastings-freecycle/message/45688?l=1", Title = "offered.wheelie bin", Body = "", Latitude = 50.85612327, Longitude = 0.578795224, PostCategoryId = 1, NumberofViews = 5, Display = true, UserId = 15, FeedId = 1},
                new Post { Url = "http://groups.yahoo.com/group/hastings-freecycle/message/45687?l=1", Title = "Wanted: Sofa (Hastings)", Body = "", Latitude = 50.85612327, Longitude = 0.578795224, PostCategoryId = 2, NumberofViews = 77, Display = true, UserId = 15, FeedId = 1}
            };
        }

        private IPostService GenerateMockPostService( List<Post> posts )
        {
            var mockRepository = new Mock<IPostService>();
            mockRepository.Setup( x => x.SelectRecordList() ).Returns( posts.AsQueryable() );
            return mockRepository.Object;
        }
    }
}
