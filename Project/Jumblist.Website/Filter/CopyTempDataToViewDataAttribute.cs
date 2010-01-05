using System.Web.Mvc;
using Jumblist.Website.ViewModel;
using Jumblist.Core.Model;

namespace Jumblist.Website.Filter
{
    public class CopyTempDataToViewDataAttribute : ActionFilterAttribute
	{
		public override void OnActionExecuted( ActionExecutedContext filterContext ) 
		{
			var result = filterContext.Result as ViewResult;

			if (result != null)
			{
                var model = result.ViewData.Model as ViewModelBase;

                if (model != null && string.IsNullOrEmpty( model.SimpleMessage ) && filterContext.Controller.TempData.ContainsKey( "simplemessage" ))
				{
                    model.SimpleMessage = filterContext.Controller.TempData["simplemessage"] as string;
				}

                if (model != null && model.NotificationMessage == null && filterContext.Controller.TempData.ContainsKey( "notificationmessage" ))
                {
                    model.NotificationMessage = filterContext.Controller.TempData["notificationmessage"] as NotificationMessage;
                }

                if (model != null && model.Notification == null && filterContext.Controller.TempData.ContainsKey( "notification" ))
                {
                    model.Notification = filterContext.Controller.TempData["notification"] as Notification;
                }
			}
		}
	}
}