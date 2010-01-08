using System.Web.Mvc;
using Jumblist.Website.Filter;
using Jumblist.Core.Model;

namespace Jumblist.Website.Controllers
{
    //[CustomAuthentication]
    [CopyTempDataToViewData]
    public abstract class JumblistControllerBase : Controller
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