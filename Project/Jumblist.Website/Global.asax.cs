using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Jumblist.Website.ModelBinder;
using Jumblist.Model.Entity;

namespace Jumblist.Website
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes( RouteCollection routes )
        {
            routes.IgnoreRoute( "{resource}.axd/{*pathInfo}" );

            routes.MapRoute(
                "Post-Detail",                                              // Route name
                "post/{id}/{name}",                           // URL with parameters
                new { controller = "posts", action = "details", id = "", name = "" }  // Parameter defaults
            );

            routes.MapRoute(
                "Basket",
                "basket/{action}",
                new { controller = "basket", action = "index" }
            );

            routes.MapRoute(
                "Admin",
                "admin/{action}",
                new { controller = "admin", action = "index" }
            );

            routes.MapRoute(
                "Pages",                                              // Route name
                "{action}",                           // URL with parameters
                new { controller = "pages", action = "index" }  // Parameter defaults
            );

            routes.MapRoute(
                "Default-TwoParameters",                                              // Route name
                "{controller}/{action}/{parameter1}/{parameter2}",                           // URL with parameters
                new { controller = "", action = "", parameter1 = "", parameter2 = "" }  // Parameter defaults
            );

            routes.MapRoute(
                "Default-OneParameter",                                              // Route name
                "{controller}/{action}/{parameter1}",                           // URL with parameters
                new { controller = "", action = "", parameter1 = "" }  // Parameter defaults
            );




        }

        protected void Application_Start()
        {
            RegisterRoutes( RouteTable.Routes );
            ControllerBuilder.Current.SetControllerFactory(new WindsorControllerFactory());
            ModelBinders.Binders.Add( typeof( Basket ), new BasketModelBinder() );
        }
    }
}