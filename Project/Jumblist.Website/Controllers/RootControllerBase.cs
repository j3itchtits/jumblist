using System.Web.Mvc;
using Jumblist.Website.Filter;
using Jumblist.Core.Model;

namespace Jumblist.Website.Controllers
{
    //[CustomAuthentication]
    //[HandleError( ExceptionType = typeof( PrimaryKeyNotFoundException ), View = "NotFound" )]
    //[HandleError( ExceptionType = typeof( ResourceNotFoundException ), View = "NotFound" )]
    //[HandleError]

    [CopyTempDataToViewData]
    //[ElmahHandleError]
    public abstract class RootControllerBase : Controller
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