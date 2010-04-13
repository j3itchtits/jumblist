using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Service.Data;
using Jumblist.Core.Model;

namespace Jumblist.Website.ModelBinder
{
    public class UserModelBinder : IModelBinder
    {
        private const string userKey = "_user";

        //private readonly IUserService userService;

        //public UserModelBinder()
        //{
        //}

        //public UserModelBinder(IUserService userService)
        //{
        //    this.userService = userService;
        //}

        #region IModelBinder Members

        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            if (bindingContext.Model != null)
                throw new InvalidOperationException("Cannot update instances");

            //User user = (controllerContext.HttpContext.User.Identity.IsAuthenticated) ? userService.SelectRecord(controllerContext.HttpContext.User.Identity.Name) : Jumblist.Core.Model.User.Anonymous;
            //User user = (controllerContext.HttpContext.User.Identity.IsAuthenticated) ? Jumblist.Core.Model.User.Administrator : Jumblist.Core.Model.User.Anonymous;

            User user = (controllerContext.HttpContext.User.Identity.IsAuthenticated) ? (controllerContext.HttpContext.Session[userKey] as User) : null;

            if (user == null)
            {
                user = Jumblist.Core.Model.User.Anonymous;
                controllerContext.HttpContext.Session[userKey] = user;
            }

            return user;
        }

        #endregion
    }
}
