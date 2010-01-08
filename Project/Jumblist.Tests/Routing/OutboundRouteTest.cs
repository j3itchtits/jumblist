using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using System.Web.Routing;
using Jumblist.Website;
using Jumblist.Tests.Mocks;

namespace Jumblist.Tests.Routing
{
    [TestFixture]
    public class OutboundRouteTest
    {
        [Test]
        public void EditPost50_HasCorrectUrl()
        {
            VirtualPathData result = GenerateUrlViaMock( 
                new { controller = "posts", action = "edit", id = "50" }
            );

            //Assert
            Assert.AreEqual( "/posts/edit/50", result.VirtualPath, "Displayed Url is wrong" );
        }

        private VirtualPathData GenerateUrlViaMock( object values )
        {
            //Arrange
            RouteCollection routeCollection = new RouteCollection();
            MvcApplication.RegisterRoutes( routeCollection );
            var mockHttpContext = new MockHttpContext().MakeMockHttpContext( null );
            RequestContext context = new RequestContext( mockHttpContext.Object, new RouteData() );

            //Act
            return routeCollection.GetVirtualPath( context, new RouteValueDictionary( values ) );
        }
    }


}
