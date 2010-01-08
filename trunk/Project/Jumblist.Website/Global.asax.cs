using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Castle.Windsor;
using Castle.MicroKernel.Registration;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.IoC;
using Jumblist.Core.Service;
using System.Configuration;
using System.Reflection;

namespace Jumblist.Website
{
    public class MvcApplication : HttpApplication
    {
        private static object _lock = new object();
        private static IWindsorContainer container;
        private readonly string jumblistDbConnString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        protected void Application_Start()
        {
            RegisterRoutes( RouteTable.Routes );
            //RegisterViewEngines( ViewEngines.Engines );
            //RegisterModelBinders();

            if ( InitializeContainer() )
            {
                RegisterControllers();
                RegisterControllerFactory();
                RegisterComponents();
            }
        }

        private bool InitializeContainer()
        {
            lock (_lock)
            {
                if (container != null)
                    return false;

                container = new WindsorContainer();

                container.Register(
                    Component.For<IWindsorContainer>().Instance( container ).LifeStyle.Singleton
                );
            }

            return true;
        }

        private void RegisterControllers()
        {
            container.Register(
                AllTypes.Of<IController>().FromAssembly( Assembly.GetExecutingAssembly() ).Configure( c => c.LifeStyle.Transient )
            );
        }

        private void RegisterComponents()
        {
            container.Register(
                Component.For<IDataContextProvider>().ImplementedBy<DataContextProvider>().LifeStyle.PerWebRequest,
                Component.For<IConnectionStringProvider>().ImplementedBy<ConnectionStringProvider>().LifeStyle.Transient.Parameters( Parameter.ForKey( "connectionString" ).Eq( jumblistDbConnString ) ),
                Component.For( typeof( IRepository<> ) ).ImplementedBy( typeof( Repository<> ) ).LifeStyle.Transient,
                Component.For( typeof( IDataService<> ) ).ImplementedBy( typeof( DataService<> ) ).LifeStyle.Transient,
                Component.For<IDataServiceResolver>().ImplementedBy<DataServiceResolver>().LifeStyle.Transient,
                Component.For<IFormsAuthenticationService>().ImplementedBy<FormsAuthenticationService>().LifeStyle.Transient,
                Component.For<IUserService>().ImplementedBy<UserService>().LifeStyle.Transient,
                Component.For<IBasketSubmitter>().ImplementedBy<EmailBasketSubmitter>().LifeStyle.Transient.Parameters( Parameter.ForKey( "smtpServer" ).Eq( "127.0.0.1" ), Parameter.ForKey( "mailFrom" ).Eq( "stuartclode@idnet.com" ), Parameter.ForKey( "mailTo" ).Eq( "stuartclode@idnet.com" ) ),
                Component.For<IActionInvoker>().ImplementedBy<WindsorActionInvoker>().LifeStyle.Transient,
                Component.For<IFeedService>().ImplementedBy<FeedService>().LifeStyle.Transient
            );
        }

        private void RegisterControllerFactory()
        {
            container.Register(
                Component.For<IControllerFactory>().ImplementedBy<WindsorControllerFactory>().LifeStyle.Transient
            );

            var controllerFactory = container.Resolve<IControllerFactory>();

            ControllerBuilder.Current.SetControllerFactory( controllerFactory );
        }

        public static void RegisterRoutes( RouteCollection routes )
        {
            if (routes == null) throw new ArgumentNullException( "routes" );

            routes.IgnoreRoute( "{resource}.axd/{*pathInfo}" );
            routes.IgnoreRoute( "{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" } );

            routes.MapRoute(
                 null,                                              // Route name
                 "{controller}/{action}/{id}",                           // URL with parameters
                 new { controller = "Pages", action = "Index", id = "" }  // Parameter defaults
                 //new { id = @"\d{1,6}" }                            // Constraints
             );

            //routes.Add(
            //    null, // Route name
            //    new Route(
            //        "Admin/{controller}/{action}/{id}", // URL with parameters
            //        new RouteValueDictionary( new { controller = "AdminPages", action = "Index", id = "" } ),
            //        new AdminRouteHandler()
            //    )
            //);    
        }

        public static void RegisterViewEngines( ViewEngineCollection engines )
        {
            if (engines == null) throw new ArgumentNullException( "engines" );

            //SparkEngineStarter.RegisterViewEngine( engines );
        }

        public static void RegisterModelBinders()
        {
            var binders = ModelBinders.Binders;

        }

        protected void Application_End( object sender, EventArgs e )
        {
            container.Dispose();
        }
    }

    public class AdminRouteHandler : IRouteHandler
    {
        public IHttpHandler GetHttpHandler( RequestContext requestContext )
        {
            RouteData routeData = requestContext.RouteData;
            routeData.Values["controller"] = "Admin" + requestContext.RouteData.GetRequiredString( "controller" );
            return new MvcHandler( requestContext );
        }
    }   
}