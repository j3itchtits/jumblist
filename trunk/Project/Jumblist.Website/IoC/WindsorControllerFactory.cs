using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Castle.Windsor;
using System.Web.Routing;
using System.Globalization;

namespace Jumblist.Website.IoC
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
            throw new Exception();
            //if ( controllerType == null )
            //{
            //    //return base.GetControllerInstance( controllerType );
            //    throw new HttpException( 404, String.Format( CultureInfo.CurrentUICulture, "No Controller Found", RequestContext.HttpContext.Request.Path ) );
            //}

            var controller = container.Resolve( controllerType ) as Controller;

            if ( controller != null )
                controller.ActionInvoker = container.Resolve<IActionInvoker>();

            return controller;
        }

        public override void ReleaseController( IController controller )
        {
            container.Release( controller );
        }
    }
}

