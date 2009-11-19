using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Castle.Windsor;
using MvcContrib.Castle;

namespace Jumblist.Website
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start()
        {
            //create the container
            var container = new WindsorContainer();

            //configure the container
            var app = new JumblistApplication();
            app.RegisterComponents( container );
            app.RegisterRoutes( RouteTable.Routes );
            app.RegisterModelBinders();
            //app.RegisterViewEngines( ViewEngines.Engines );

            //set the controller factory
            ControllerBuilder.Current.SetControllerFactory( new WindsorControllerFactory( container ) );
            
        }

    }
}