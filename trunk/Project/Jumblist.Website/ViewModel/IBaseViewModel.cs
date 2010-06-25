using System;
using Jumblist.Core.Model;
using System.Collections.Generic;
using Jumblist.Website.ViewModel;

namespace Jumblist.Website.ViewModel
{
    public interface IBaseViewModel
    {
        string PageTitle { get; set; }
        string SimpleMessage { get; set; }
        Message Message { get; set; }
        List<Message> MessageList { get; set; }
        User User { get; set; }
        string ReturnUrl { get; set; }
        PostListRouteValues PostListRouteValues { get; set; }
        Location UserLocation { get; set; }

    }
}
