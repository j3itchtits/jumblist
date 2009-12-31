using System;
using Jumblist.Core.Model;

namespace Jumblist.Website
{
    public interface IViewModelBase
    {
        string PageTitle { get; set; }
        NotificationMessage NotificationMessage { get; set; }
        Notification Notification { get; set; }
        string SimpleMessage { get; set; }
    }
}
