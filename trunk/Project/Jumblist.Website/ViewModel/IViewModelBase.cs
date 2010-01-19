using System;
using Jumblist.Core.Model;
using System.Collections.Generic;

namespace Jumblist.Website
{
    public interface IViewModelBase
    {
        string PageTitle { get; set; }
        string SimpleMessage { get; set; }
        Message Message { get; set; }
        List<Message> MessageList { get; set; }
    }
}
