using System;
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

        public WindsorControllerFactory()
        {
            container = new WindsorContainer(new XmlInterpreter(new ConfigResource("castle")));

            var controllerTypes = from t in Assembly.GetExecutingAssembly().GetTypes()
                                  where typeof(IController).IsAssignableFrom(t)
                                  select t;

            foreach (var t in controllerTypes)
            {
                container.AddComponentWithLifestyle(t.FullName, t, LifestyleType.Transient);
            }
        }
    }
}
