using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Configuration;
using System.Reflection;
using Castle.Windsor;
using Castle.MicroKernel.Registration;
using Jumblist.Website.Filter;
using Jumblist.Core.Service;
using Jumblist.Website.Controllers;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Service;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Views;
using StuartClode.Mvc.IoC;

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
            RegisterViewEngines( ViewEngines.Engines );
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
            container.Register( AllTypes
                .Of<IController>()
                .FromAssembly( Assembly.GetExecutingAssembly() )
                .Configure( c => c.LifeStyle.Transient )
            );

            //container.Register( AllTypes
            //    .Of<IController>()
            //    .FromAssembly( Assembly.GetExecutingAssembly() )
            //    .Configure( c => c.LifeStyle.Transient.ServiceOverrides( new { ActionInvoker = typeof( ErrorHandlingActionInvoker ).FullName } ) )
            //);
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
                Component.For<IFeedService>().ImplementedBy<FeedService>().LifeStyle.Transient,
                //Component.For<IExceptionFilter>().ImplementedBy<ElmahHandleErrorAttribute>().LifeStyle.Transient,
                Component.For<IActionInvoker>().ImplementedBy<WindsorActionInvoker>().LifeStyle.Transient
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

            // Routing config for the admin area
            routes.CreateArea( 
                "admin", 
                "Jumblist.Website.Areas.Admin.Controllers",
                routes.MapRoute( 
                    null, 
                    "admin/{controller}/{action}/{id}", 
                    new { controller = "Home", action = "Index", id = "" } 
                )
            );

            // Routing config for the root (public) area
            routes.CreateArea(
                "root",
                "Jumblist.Website.Controllers",
                routes.MapRoute(
                    null,
                    "{controller}/{action}/{id}",
                    new { controller = "Home", action = "Index", id = "" }
                )
            );
        }

        public static void RegisterViewEngines( ViewEngineCollection engines )
        {
            if (engines == null) throw new ArgumentNullException( "engines" );

            engines.Clear();
            engines.Add( new AreaViewEngine() );

            //SparkEngineStarter.RegisterViewEngine( engines );
        }

        public static void RegisterModelBinders()
        {
            //var binders = ModelBinders.Binders;

        }

        protected void Application_Error( object sender, EventArgs e )
        {
            // If custom errors are disabled, we need to let the normal ASP.NET exception handler
            // execute so that the user can see useful debugging information.
            if (!this.Context.IsCustomErrorEnabled)
            {
                return;
            }

            Exception exception = Server.GetLastError();
            HttpException httpException = exception as HttpException;

            Response.Clear();

            RouteData routeData = new RouteData();
            routeData.Values.Add( "controller", "Error" );

            int responseStatusCode; 

            if (httpException == null)
            {
                responseStatusCode = 500;
                routeData.Values.Add( "action", "Index" );
            }
            else
            {
                responseStatusCode = httpException.GetHttpCode();

                switch (responseStatusCode)
                {
                    case 404:
                        // Page not found.
                        routeData.Values.Add( "action", "HttpError404" );
                        break;
                    case 500:
                        // Server error.
                        routeData.Values.Add( "action", "HttpError500" );
                        break;

                    // Here you can handle Views to other error codes.
                    // I choose a General error template  
                    default:
                        routeData.Values.Add( "action", "General" );
                        break;
                }
                
            }

            // Pass exception details to the target error View.
            routeData.Values.Add( "error", exception );

            // Clear the error on server.
            Server.ClearError();

            // Call target Controller and pass the routeData.
            IController errorController = new ErrorController();
            HttpContextWrapper context = new HttpContextWrapper( Context );
            context.Response.StatusCode = responseStatusCode;

            errorController.Execute( new RequestContext( context, routeData ) );
        }

        protected void Application_End( object sender, EventArgs e )
        {
            container.Dispose();
        }
    }  
}