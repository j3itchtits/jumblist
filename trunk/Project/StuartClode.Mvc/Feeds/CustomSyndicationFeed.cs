using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using System.Collections;
using System.Text.RegularExpressions;
using Microsoft.Web.Testing.Light;
using System.ServiceModel.Syndication;
using System.Xml;

namespace StuartClode.Mvc.Feeds
{
    public class CustomSyndicationFeed// : ISyndicationFeed
    {
        public static SyndicationFeed Load( string uri, string username, string password )
        {
            XmlReader feedSource = GetFeedSource( uri, username, password );
            return ProcessFeedSource( feedSource );
        }

        public static XmlReader GetFeedSource( string uri, string username, string password )
        {
            return XmlReader.Create( uri );
        }

        public static SyndicationFeed ProcessFeedSource( XmlReader feedSource )
        {
            return SyndicationFeed.Load( feedSource );
        }
    }
}
