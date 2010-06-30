using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Jumblist.Core.Model;
using System.Configuration;

namespace Jumblist.Website.ModelBinder
{
    public class JumblistSessionModelBinder : IModelBinder
    {
        private readonly string jumblistSessionKey = ConfigurationManager.AppSettings["JumblistSessionModelBinderKey"];

        #region IModelBinder Members

        public object BindModel( ControllerContext controllerContext, ModelBindingContext bindingContext )
        {
            if ( controllerContext == null )
            {
                throw new ArgumentNullException( "controllerContext" );
            }

            if ( bindingContext == null )
            {
                throw new ArgumentNullException( "bindingContext" );
            }

            if ( bindingContext.Model != null )
            {
                throw new InvalidOperationException( "Cannot update instances" );
            }

            JumblistSession jumblistSession = controllerContext.HttpContext.Session[jumblistSessionKey] as JumblistSession;

            if ( jumblistSession == null )
            {
                jumblistSession = new 
                    JumblistSession()
                    {
                        Basket = new Basket(),
                        UserSearchArea = new UserSearchArea(),
                        PageSize = null,
                        PostListRouteValues = new PostListRouteValues()
                    };

                controllerContext.HttpContext.Session[jumblistSessionKey] = jumblistSession;
            }

            return jumblistSession;
        }

        #endregion
    }
}
