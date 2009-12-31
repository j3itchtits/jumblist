using System.Web.Mvc;
using JumblistTest.Website.Filter;
using JumblistTest.Core.Model;

namespace JumblistTest.Website.Controller
{
    //[CustomAuthentication]
    [CopyTempDataToViewData]
    public abstract class ControllerBase : System.Web.Mvc.Controller
    {
        public NotificationMessage NotificationMessage
        {
            get { return TempData["notificationmessage"] as NotificationMessage; }
            set { TempData["notificationmessage"] = value; }
        }

        public Notification Notification
        {
            get { return TempData["notification"] as Notification; }
            set { TempData["notification"] = value; }
        }

        public string SimpleMessage
        {
            get { return TempData["simplemessage"] as string; }
            set { TempData["simplemessage"] = value; }
        }

    }
}