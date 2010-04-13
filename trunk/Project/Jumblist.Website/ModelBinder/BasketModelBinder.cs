using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Jumblist.Core.Model;
using System.Configuration;

namespace Jumblist.Website.ModelBinder
{
    public class BasketModelBinder : IModelBinder
    {
        private readonly string basketCookieKey = ConfigurationSettings.AppSettings["BasketModelBinderKey"];

        #region IModelBinder Members

        public object BindModel( ControllerContext controllerContext, ModelBindingContext bindingContext )
        {
            if (bindingContext.Model != null)
                throw new InvalidOperationException( "Cannot update instances" );

            Basket basket = controllerContext.HttpContext.Session[basketCookieKey] as Basket;

            if (basket == null)
            {
                basket = new Basket();
                controllerContext.HttpContext.Session[basketCookieKey] = basket;
            }
            
            return basket;
        }

        #endregion
    }
}
