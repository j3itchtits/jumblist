﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Castle.Windsor;
using Castle.Windsor.Configuration.Interpreters;
using Castle.Core.Resource;
using System.Reflection;
using Castle.Core;

namespace Jumblist.Website
{
    public class WindsorControllerFactory : DefaultControllerFactory
    {
        private WindsorContainer container;

        // The constructor:
        // 1. Sets up a new IoC container
        // 2. Registers all components specified in web.config
        // 3. Registers all controller types as components
        public WindsorControllerFactory()
        {
            // Instantiate a container, taking configuration from web.config
            container = new WindsorContainer(new XmlInterpreter(new ConfigResource("castle")));

            // Also register all the controller types as transient
            var controllerTypes = from t in Assembly.GetExecutingAssembly().GetTypes()
                                  where typeof(IController).IsAssignableFrom(t)
                                  select t;

            foreach (var t in controllerTypes)
            {
                container.AddComponentLifeStyle(t.FullName, t, LifestyleType.Transient);
            }
        }

        // Constructs the controller instance needed to service each request
        protected override IController GetControllerInstance( Type controllerType )
        {
            return (IController)container.Resolve( controllerType );
        }
    }
}
