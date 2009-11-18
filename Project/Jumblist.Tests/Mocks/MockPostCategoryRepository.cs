using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Moq;
using Jumblist.Data.Access;
using Jumblist.Data.Entity;

namespace Jumblist.Tests.Mocks
{
    public class MockPostCategoryRepository
    {
        private List<PostCategory> postCategoryList;
        private IPostCategoryRepository postCategoryRepository;

        public MockPostCategoryRepository()
        {
            postCategoryList = GenerateListOfPostCategories();
            postCategoryRepository = GenerateMockPostCategoryRepository( postCategoryList );
        }

        public MockPostCategoryRepository( List<PostCategory> postCategoryList )
        {
            postCategoryRepository = GenerateMockPostCategoryRepository( postCategoryList );
        }

        public IPostCategoryRepository Repository
        {
            get { return postCategoryRepository; }
        }

        private List<PostCategory> GenerateListOfPostCategories()
        {
            return new List<PostCategory>() { 
                new PostCategory { Name = "Offered" },
                new PostCategory { Name = "Wanted" }
            };
        }

        private IPostCategoryRepository GenerateMockPostCategoryRepository( List<PostCategory> postCategories )
        {
            var mockRepository = new Mock<IPostCategoryRepository>();
            mockRepository.Setup( x => x.PostCategories ).Returns( postCategories.AsQueryable() );
            return mockRepository.Object;
        }
    }
}
