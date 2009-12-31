using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Castle.Windsor;
using System.Web.Mvc;
using JumblistTest.Website.Extension;

namespace JumblistTest.Website.IoC
{
    public class WindsorActionInvoker : ControllerActionInvoker
    {
        private readonly IWindsorContainer container;

        public WindsorActionInvoker( IWindsorContainer container )
        {
            this.container = container;
        }

        protected override ActionExecutedContext InvokeActionMethodWithFilters( ControllerContext controllerContext, IList<IActionFilter> filters, ActionDescriptor actionDescriptor, IDictionary<string, object> parameters )
        {
            foreach (IActionFilter actionFilter in filters)
            {
                container.Kernel.InjectProperties( actionFilter );
            }

            return base.InvokeActionMethodWithFilters( controllerContext, filters, actionDescriptor, parameters );
        }

        protected override AuthorizationContext InvokeAuthorizationFilters( ControllerContext controllerContext, IList<IAuthorizationFilter> filters, ActionDescriptor actionDescriptor )
        {
            foreach (IAuthorizationFilter authFilter in filters)
            {
                container.Kernel.InjectProperties( authFilter );
            }

            return base.InvokeAuthorizationFilters( controllerContext, filters, actionDescriptor );
        }
    }
}
