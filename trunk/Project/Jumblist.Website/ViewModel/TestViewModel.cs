using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.ServiceModel.Syndication;

namespace Jumblist.Website.ViewModel
{
    public class TestViewModel<T> : ViewModelBase
    {
        public T Item { get; set; }

        public TestViewModel<T> With( T item )
        {
            Item = item;
            return this;
        }
    }

    public class TestViewModel
    {
        public SyndicationFeed Feed { get; set; }

        public TestViewModel With( SyndicationFeed feed )
        {
            Feed = feed;
            return this;
        }
    }

    public class TestView
    {
        public static TestViewModel<T> Model<T>()
        {
            return new TestViewModel<T>();
        }

        public static TestViewModel Model()
        {
            return new TestViewModel();
        }
    }
}
