using System.Web.Mvc;
using JumblistTest.Website.ViewModel;
using JumblistTest.Core.Model;

namespace JumblistTest.Website.Filter
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

                if ( model != null && model.NotificationMessage == null && filterContext.Controller.TempData.ContainsKey( "message" ) )
                {
                    model.NotificationMessage = filterContext.Controller.TempData["notificationmessage"] as NotificationMessage;
                }
			}
		}
	}
}