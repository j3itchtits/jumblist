using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using Jumblist.Website.Controllers;
using System.Web.Mvc;

namespace Jumblist.Tests.Controllers
{
    [TestFixture]
    public class PagesControllerTest
    {
        [Test]
        public void HomePage_Displays_Correctly()
        {
            // Arrange
            var controller = new HomeController();

            // Act
            var result = controller.Index();

            // Assert
            Assert.IsNotNull(result);
        }
    }
}
