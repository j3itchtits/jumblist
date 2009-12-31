using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using Jumblist.Tests.Mocks;
using Jumblist.Website.Controller;
using System.Web.Mvc;
using Jumblist.Core.Model;


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
            var controller = new PostsController( postRepository );

            //Act
            var result = controller.List();

            // Assert
            Assert.IsNotNull(result);
        }

        [Test]
        public void List_Correct_Number_Of_Items_Displayed_On_Page()
        {
            //Arrange
            var postRepository = new MockPostRepository().Repository;
            var postCategoryRepository = new MockPostCategoryRepository().Repository;
            var controller = new PostsController( postRepository );

            //Act
            var result = controller.List();
            var posts = result.ViewData.Model as IList<Post>;
            
            // Assert
            Assert.AreEqual(2, posts.Count, "Wrong number of posts");
        }

        [Test]
        public void List_Presents_Correct_Page_Of_Posts()
        {
            //Arrange
            var postRepository = new MockPostRepository().Repository;
            var postCategoryRepository = new MockPostCategoryRepository().Repository;
            var controller = new PostsController( postRepository );
            //controller.PageSize = 3;

            //Act
            var result = controller.List();

            //Assert
            Assert.IsNotNull( result, "Didn't render the view" );

            var posts = result.ViewData.Model as IList<Post>;
            Assert.AreEqual( 2, posts.Count, "Wrong number of posts" );

            Assert.AreEqual( "Wanted: Fridge", posts[0].Title );
            Assert.AreEqual( "Taken: Socks", posts[1].Title );
        }

        [Test]
        public void List_Includes_All_Posts_When_Category_IsNull()
        {

        }
    }
}
