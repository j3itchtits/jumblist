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
    public class InboundRouteTest
    {
        [Test]
        public void ForwardSlashGoesToHomeIndex()
        {
            //Arrange
            RouteCollection routeCollection = new RouteCollection();
            MvcApplication.RegisterRoutes( routeCollection );
            var mockHttpContext = new MockHttpContext().MakeMockHttpContext( "~/" );

            //Act
            RouteData routeData = routeCollection.GetRouteData( mockHttpContext.Object );

            //Assert
            Assert.IsNotNull( routeData, "Null RouteData was returned" );
            Assert.IsNotNull( routeData.Route, "No route was matched" );
            Assert.AreEqual( "Pages", routeData.Values["controller"], "Wrong controller" );
            Assert.AreEqual( "Index", routeData.Values["action"], "Wrong action" );
        }

        private RouteData TestRoute( string url, object expectedValues )
        {
            //Arrange
            RouteCollection routeCollection = new RouteCollection();
            MvcApplication.RegisterRoutes( routeCollection );
            var mockHttpContext = new MockHttpContext().MakeMockHttpContext( url );

            //Act
            RouteData routeData = routeCollection.GetRouteData( mockHttpContext.Object );

            //Assert
            Assert.IsNotNull( routeData, "Null RouteData was returned" );
            Assert.IsNotNull( routeData.Route, "No route was matched" );

            var expectedDict = new RouteValueDictionary( expectedValues );

            foreach ( var item in expectedDict )
            {
                if ( item.Value == null )
                    Assert.IsNull( routeData.Values[item.Key] );
                else
                    Assert.AreEqual( item.Value.ToString(), routeData.Values[item.Key].ToString() );
            }

            return routeData;
        }
    }
}
