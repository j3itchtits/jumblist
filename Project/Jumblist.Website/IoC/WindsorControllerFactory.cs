using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Castle.Windsor;
using System.Web.Routing;

namespace JumblistTest.Website.IoC
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
            if ( controllerType == null )
                return base.GetControllerInstance( controllerType );

            //var controller = container.Resolve( controllerType ) as IController;

            var controller = container.Resolve( controllerType ) as System.Web.Mvc.Controller;
            if (controller != null)
                controller.ActionInvoker = container.Resolve<IActionInvoker>();

            return controller;
        }

        public override void ReleaseController( IController controller )
        {
            container.Release( controller );
        }
    }
}

