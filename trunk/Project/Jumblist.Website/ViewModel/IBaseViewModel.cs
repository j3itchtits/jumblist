using System;
using Jumblist.Core.Model;
using System.Collections.Generic;

namespace Jumblist.Website
{
    public interface IBaseViewModel
    {
        string PageTitle { get; set; }
        string SimpleMessage { get; set; }
        Message Message { get; set; }
        List<Message> MessageList { get; set; }
        User User { get; set; }
    }
}
