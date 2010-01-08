using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using System.Web.Mvc;
using Jumblist.Website.Extension;

namespace Jumblist.Tests.Helpers
{
    [TestFixture]
    public class PagingLinksHelperTest
    {
        [Test]
        public void PagingLinks_Method_Extends_HtmlHelper()
        {
            HtmlHelper helper = null;
            helper.PagingLinks( 0, 0, null );
        }

        [Test]
        public void PagingLinks_Produces_Anchor_Tags()
        {
            HtmlHelper helper = null;
            string links = helper.PagingLinks( 2, 3, i => "Page" + i );

            Assert.AreEqual( @"<a href=""page1"">1</a> <a class=""selected"" href=""page2"">2</a> <a href=""page3"">3</a> ", links, "Html string is not right" );
        }
    }
}
