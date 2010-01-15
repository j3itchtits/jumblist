using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Castle.Windsor;
using System.Web.Routing;
using System.Globalization;

namespace StuartClode.Mvc.IoC
{
    public class WindsorControllerFactory : DefaultControllerFactory
    {
        readonly IWindsorContainer container;

        public WindsorControllerFactory( IWindsorContainer container )
        {
            this.container = container;
        }

        protected override IController GetControllerInstance( Type controllerType )
        {
            //throw new Exception();
            if (controllerType == null)
            {
                //return base.GetControllerInstance( controllerType );
                throw new HttpException( 404, string.Format( CultureInfo.CurrentUICulture, "The controller for path '{0}' could not be found or it does not implement IController.", RequestContext.HttpContext.Request.Path ) );
            }

            try
            {
                var controller = container.Resolve( controllerType ) as Controller;
                if (controller != null)
                    controller.ActionInvoker = container.Resolve<IActionInvoker>();
                return (IController)controller;
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException( String.Format( CultureInfo.CurrentUICulture, "The controller type '{0}' could not resolve to a controller.", controllerType ), ex );
            }
        }


        public override void ReleaseController( IController controller )
        {
            var disposable = controller as IDisposable;

            if (disposable != null)
            {
                disposable.Dispose();
            }

            container.Release( controller );
        }
    }
}

