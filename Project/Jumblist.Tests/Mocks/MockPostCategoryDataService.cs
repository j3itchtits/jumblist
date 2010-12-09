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
    public class MockPostCategoryDataService
    {
        private List<PostCategory> postCategoryList;
        private IDataService<PostCategory> postCategoryDataService;

        public MockPostCategoryDataService()
        {
            postCategoryList = GenerateListOfPostCategories();
            postCategoryDataService = GenerateMockPostCategoryDataService( postCategoryList );
        }

        public MockPostCategoryDataService( List<PostCategory> postCategoryList )
        {
            postCategoryDataService = GenerateMockPostCategoryDataService( postCategoryList );
        }

        public IDataService<PostCategory> DataService
        {
            get { return postCategoryDataService; }
        }

        private List<PostCategory> GenerateListOfPostCategories()
        {
            return new List<PostCategory>() { 
                new PostCategory { Name = "Offered", AlternativeSearchText = "Offer", IsNavigation = true },
                new PostCategory { Name = "Wanted", AlternativeSearchText = "Want", IsNavigation = true }
            };
        }

        private IDataService<PostCategory> GenerateMockPostCategoryDataService( List<PostCategory> postCategories )
        {
            var mockRepository = new Mock<IDataService<PostCategory>>();
            mockRepository.Setup( x => x.SelectRecordList() ).Returns( postCategories.AsQueryable() );
            return mockRepository.Object;
        }
    }
}
