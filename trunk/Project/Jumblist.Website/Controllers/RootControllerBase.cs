using System.Web.Mvc;
using Jumblist.Website.Filter;
using Jumblist.Core.Model;
using System.Collections.Generic;

namespace Jumblist.Website.Controllers
{
    //[CustomAuthentication]
    //[HandleError( ExceptionType = typeof( PrimaryKeyNotFoundException ), View = "NotFound" )]
    //[HandleError( ExceptionType = typeof( ResourceNotFoundException ), View = "NotFound" )]
    //[HandleError]

    //[ElmahHandleError]
    //[CompressResponse]
    [CopyTempDataToViewData]
    public abstract class RootControllerBase : Controller
    {
        internal const int frontEndPageSize = 5;

        public virtual string SimpleMessage
        {
            get { return TempData["simplemessage"] as string; }
            set { TempData["simplemessage"] = value; }
        }

        public virtual Message Message
        {
            get { return TempData["message"] as Message; }
            set { TempData["message"] = value; }
        }

        public virtual List<Message> MessageList
        {
            get { return TempData["messagelist"] as List<Message>; }
            set { TempData["messagelist"] = value; }
        }
    }
}