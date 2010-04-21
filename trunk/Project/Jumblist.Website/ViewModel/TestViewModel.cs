using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.ServiceModel.Syndication;

namespace Jumblist.Website.ViewModel
{


    public class TestViewModel : ViewModelBase
    {
        public SyndicationFeed Feed { get; set; }
        public string HttpResponse { get; set; }

        public TestViewModel With( SyndicationFeed feed )
        {
            Feed = feed;
            return this;
        }

        public TestViewModel With( string httpResponse )
        {
            HttpResponse = httpResponse;
            return this;
        }
    }

    public class TestView
    {
        public static TestViewModel CreateModel()
        {
            return new TestViewModel();
        }
    }
}
