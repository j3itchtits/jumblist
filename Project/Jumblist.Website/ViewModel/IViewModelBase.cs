using System;
using JumblistTest.Core.Model;

namespace JumblistTest.Website
{
    public interface IViewModelBase
    {
        string PageTitle { get; set; }
        NotificationMessage NotificationMessage { get; set; }
        Notification Notification { get; set; }
        string SimpleMessage { get; set; }
    }
}
