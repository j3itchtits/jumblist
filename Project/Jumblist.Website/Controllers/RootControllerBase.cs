using System.Web.Mvc;
using Jumblist.Website.Filter;
using Jumblist.Core.Model;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.IoC;

namespace Jumblist.Website.Controllers
{
    //[CustomAuthentication]
    [CopyTempDataToViewData]
    //[HandleError( ExceptionType = typeof( PrimaryKeyNotFoundException ), View = "NotFound" )]
    //[HandleError( ExceptionType = typeof( ResourceNotFoundException ), View = "NotFound" )]
    //[HandleError]
    [ElmahHandleError]
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