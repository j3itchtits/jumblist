using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Jumblist.Core.Model;

namespace Jumblist.Website.ModelBinder
{
    public class BasketModelBinder : IModelBinder
    {
        private const string basketCookieKey = "_basket";

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
