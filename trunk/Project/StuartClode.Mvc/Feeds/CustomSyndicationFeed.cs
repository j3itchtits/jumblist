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
    public class CustomSyndicationFeed
    {
        public static SyndicationFeed Load( string uri )
        {
            XmlReader feedSource = XmlReader.Create( uri );

            return SyndicationFeed.Load( feedSource );
        }
    }
}
