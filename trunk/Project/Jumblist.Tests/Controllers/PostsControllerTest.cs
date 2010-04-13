using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using Jumblist.Tests.Mocks;
using Jumblist.Website.Controllers;
using System.Web.Mvc;
using Jumblist.Core.Model;
using Jumblist.Website.ViewModel;


namespace Jumblist.Tests.Controllers
{
    [TestFixture]
    public class PostsControllerTest
    {
        [Test]
        public void List_FirstPage_IsDisplayed()
        {
            //Arrange
            var postRepository = new MockPostRepository().Repository;
            var postCategoryRepository = new MockPostCategoryRepository().Repository;
            var controller = new PostsController( postRepository, null, null, null, null, null );

            //Act
            var result = controller.Index( null, null );

            // Assert
            Assert.IsNotNull(result);
        }

        [Test]
        public void List_Correct_Number_Of_Items_Displayed_On_Page()
        {
            //Arrange
            var postRepository = new MockPostRepository().Repository;
            var postCategoryRepository = new MockPostCategoryRepository().Repository;
            var controller = new PostsController( postRepository, null, null, null, null, null );

            //Act
            var result = controller.Index( null, null );
            var model = result.ViewData.Model as DefaultViewModel<Post>;
            
            // Assert
            Assert.IsNotNull( model.PaginatedList );
            Assert.AreEqual( 3, model.PaginatedList.Count, "Wrong number of posts" );
        }

        [Test]
        public void List_Presents_Correct_Page_Of_Posts()
        {
            //Arrange
            var postRepository = new MockPostRepository().Repository;
            var postCategoryRepository = new MockPostCategoryRepository().Repository;
            var controller = new PostsController( postRepository, null, null, null, null, null );
            //controller.PageSize = 3;

            //Act
            var result = controller.Index( null, null );
            var model = result.ViewData.Model as DefaultViewModel<Post>;

            //Assert
            Assert.IsNotNull( model.PaginatedList );
            Assert.AreEqual( "Wanted: Socks", model.PaginatedList.ElementAt<Post>( 0 ).Title );
            Assert.AreEqual( "Offered: Linen", model.PaginatedList.ElementAt<Post>( 1 ).Title );
        }

        [Test]
        public void List_Includes_All_Posts_When_Category_IsNull()
        {

        }
    }
}
