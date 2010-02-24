using System.Web.Mvc;
using Jumblist.Website.ViewModel;
using Jumblist.Core.Model;
using System.Collections.Generic;

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

                if (model != null && filterContext.Controller.TempData.ContainsKey( "message" ))
                {
                    model.Message = filterContext.Controller.TempData["message"] as Message;
                }

                if (model != null && filterContext.Controller.TempData.ContainsKey( "messagelist" ))
                {
                    model.MessageList = filterContext.Controller.TempData["messagelist"] as List<Message>;
                }
			}
		}
	}
}