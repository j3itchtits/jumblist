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
            if ( controllerType == null )
            {
                return base.GetControllerInstance( controllerType );
                //throw new Exception();
            }

            var controller = container.Resolve( controllerType ) as Controller;

            if ( controller != null )
                controller.ActionInvoker = container.Resolve<IActionInvoker>();

            return controller;
        }

        //public override IController CreateController( RequestContext requestContext, string controllerName )
        //{
        //    if ( requestContext == null )
        //    {
        //        throw new ArgumentNullException( "requestContext" );
        //    }
        //    if ( String.IsNullOrEmpty( controllerName ) )
        //    {
        //        throw new ArgumentException( "Null or Empty", "controllerName" );
        //    }
        //    RequestContext = requestContext;
        //    Type controllerType = GetControllerType( controllerName );

        //    if (controllerType == null)
        //    {
        //        controllerName = "Error";
        //        controllerType = GetControllerType(controllerName);
        //        requestContext.RouteData.Values["Controller"] = "Error";
        //        requestContext.RouteData.Values["action"] = "NotFound";
        //    }

        //    IController controller = GetControllerInstance( controllerType );
        //    return controller;
        //}

        public override void ReleaseController( IController controller )
        {
            container.Release( controller );
        }
    }
}

