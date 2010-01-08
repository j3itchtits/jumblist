using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Moq;

namespace Jumblist.Tests.Mocks
{
    public class MockHttpContext
    {
        public Mock<HttpContextBase> MakeMockHttpContext( string url )
        {
            var mockHttpContext = new Mock<HttpContextBase>();

            //Mock the request
            var mockRequest = new Mock<HttpRequestBase>();
            mockHttpContext.Setup( x => x.Request ).Returns( mockRequest.Object );
            mockRequest.Setup( x => x.AppRelativeCurrentExecutionFilePath ).Returns( url );

            //Mock the response
            var mockResponse = new Mock<HttpResponseBase>();
            mockHttpContext.Setup( x => x.Response ).Returns( mockResponse.Object );
            mockResponse.Setup( x => x.ApplyAppPathModifier( It.IsAny<string>() ) ).Returns<string>( x => x );

            return mockHttpContext;
        }
    }
}
