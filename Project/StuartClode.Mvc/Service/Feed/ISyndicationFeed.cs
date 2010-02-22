using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel.Syndication;

namespace StuartClode.Mvc.Service.Feed
{
    interface ISyndicationFeed
    {
        SyndicationFeed Load(string uri, string username, string password);
    }
}
