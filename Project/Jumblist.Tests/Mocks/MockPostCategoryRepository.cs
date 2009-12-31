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
    public class MockPostCategoryRepository
    {
        private List<PostCategory> postCategoryList;
        private IDataService<PostCategory> postCategoryRepository;

        public MockPostCategoryRepository()
        {
            postCategoryList = GenerateListOfPostCategories();
            postCategoryRepository = GenerateMockPostCategoryRepository( postCategoryList );
        }

        public MockPostCategoryRepository( List<PostCategory> postCategoryList )
        {
            postCategoryRepository = GenerateMockPostCategoryRepository( postCategoryList );
        }

        public IDataService<PostCategory> Repository
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

        private IDataService<PostCategory> GenerateMockPostCategoryRepository( List<PostCategory> postCategories )
        {
            var mockRepository = new Mock<IDataService<PostCategory>>();
            mockRepository.Setup( x => x.SelectList() ).Returns( postCategories.AsQueryable() );
            return mockRepository.Object;
        }
    }
}
