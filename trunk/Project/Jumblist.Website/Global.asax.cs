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
using Jumblist.Website.Controllers;
using Jumblist.Website.Module;
using Jumblist.Website.ModelBinder;
using Jumblist.Core.Service;
using Jumblist.Core.Service.Basket;
using Jumblist.Core.Model;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.IoC;
using Microsoft.Practices.ServiceLocation;
using System.Web.Security;
using System.Security.Principal;
using System.Xml.Serialization;
using System.IO;
using System.Runtime.Serialization;
using System.Xml;

namespace Jumblist.Website
{
    public class MvcApplication : HttpApplication
    {
        private static object _lock = new object();
        private static IWindsorContainer container;
        private readonly string jumblistDbConnString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
        private readonly string userKey = ConfigurationManager.AppSettings["UserModelBinderKey"];

        protected void Application_Start()
        {
            RegisterRoutes( RouteTable.Routes );
            //RegisterViewEngines( ViewEngines.Engines );
            RegisterModelBinders();

            if ( InitializeContainer() )
            {
                RegisterControllers();
                RegisterControllerFactory();
                RegisterDataServices();
                RegisterComponents();
            }
        }

        protected void Session_Start()
        {
            Session[userKey] = Jumblist.Core.Model.User.Anonymous;

            //Create a session variable to persist the anonymous user across requests
            //Session[userKey] = Jumblist.Core.Model.User.Anonymous;

            //If we use a cookie instead of the session (above) then we probably need to serialize and encode the User.Anonymous objsct

            //HttpCookie MyCookie = new HttpCookie( userKey );
            //DateTime now = DateTime.Now;

            //MyCookie.Value = now.ToString();
            //MyCookie.Expires = now.AddHours( 1 );

            //Response.Cookies.Add( MyCookie );

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

                //setup the common service locator
                ServiceLocator.SetLocatorProvider( () => new WindsorServiceLocator( container ) );
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
        }

        private void RegisterComponents()
        {
            container.Register(
                Component.For<IBasketSubmitter>().ImplementedBy<EmailBasketSubmitter>().LifeStyle.Transient.Parameters( Parameter.ForKey( "smtpServer" ).Eq( "127.0.0.1" ), Parameter.ForKey( "mailFrom" ).Eq( "stuartclode@idnet.com" ), Parameter.ForKey( "mailTo" ).Eq( "stuartclode@idnet.com" ) ),

                Component.For<IDataContextProvider>().ImplementedBy<DataContextProvider>().LifeStyle.Transient,
                Component.For<IConnectionStringProvider>().ImplementedBy<ConnectionStringProvider>().LifeStyle.Transient.Parameters( Parameter.ForKey( "connectionString" ).Eq( jumblistDbConnString ) ),
                Component.For( typeof( IRepository<> ) ).ImplementedBy( typeof( Repository<> ) ).LifeStyle.Transient,
                Component.For( typeof( IDataService<> ) ).ImplementedBy( typeof( DataService<> ) ).LifeStyle.Transient,
                Component.For<IDataServiceResolver>().ImplementedBy<DataServiceResolver>().LifeStyle.Transient,
                //Component.For<IFormsAuthenticationService>().ImplementedBy<FormsAuthenticationService>().LifeStyle.Transient,
                //Component.For<ISearchService>().ImplementedBy<SearchService>().LifeStyle.Transient,
                Component.For<IActionInvoker>().ImplementedBy<WindsorActionInvoker>().LifeStyle.Transient
            );

            //container.Register(
            //    Component.For<IHttpModule>().ImplementedBy<FeedProcessingHttpModule>().LifeStyle.Custom<PerHttpApplicationLifestyleManager>()
            //);
        }

        private void RegisterControllerFactory()
        {
            container.Register(
                Component.For<IControllerFactory>().ImplementedBy<WindsorControllerFactory>().LifeStyle.Transient
            );

            var controllerFactory = container.Resolve<IControllerFactory>();

            ControllerBuilder.Current.SetControllerFactory( controllerFactory );
        }

        private void RegisterDataServices()
        {
            container.Register(AllTypes
                .FromAssembly(Assembly.Load("Jumblist.Core"))
                .Where(t => t.Namespace.Equals("Jumblist.Core.Service"))
                .WithService.FirstNonGenericCoreInterface("Jumblist.Core.Service")
                .Configure(c => c.LifeStyle.Transient)
            );

            //container.Register( AllTypes
            //    .FromAssembly( Assembly.GetAssembly( typeof( UserService ) ) )
            //    .Where( type => type.Namespace.StartsWith( "Jumblist.Core.Service" ) )
            //    .WithService.FirstInterface()
            //    .Configure( c => c.LifeStyle.Transient )
            //);

            //container.Register( AllTypes.Pick()
            //    .FromAssembly( Assembly.GetExecutingAssembly() )
            //    .WithService
            //    .FirstInterface()
            //    .Configure( c => c.LifeStyle.Transient )
            //);
        }

        public static void RegisterRoutes( RouteCollection routes )
        {
            if (routes == null) throw new ArgumentNullException( "routes" );

            routes.IgnoreRoute( "{resource}.axd/{*pathInfo}" );
            routes.IgnoreRoute( "{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" } );

            //// Routing config for the admin area
            //routes.CreateArea( 
            //    "admin", 
            //    "Jumblist.Website.Areas.Admin.Controllers",
            //    routes.MapRoute( 
            //        null, 
            //        "admin/{controller}/{action}/{id}", 
            //        new { controller = "Home", action = "Index", id = "" } 
            //    )
            //);

            //// Routing config for the root (public) area
            //routes.CreateArea(
            //    "root",
            //    "Jumblist.Website.Controllers",
            //    routes.MapRoute(
            //        null,
            //        "{controller}/{action}/{id}",
            //        new { controller = "Home", action = "Index", id = "" }
            //    )
            //);

            AreaRegistration.RegisterAllAreas();

            routes.MapRoute(
                "Post-Detail",                                              // Route name
                "post/{id}/{name}",                           // URL with parameters
                new { controller = "posts", action = "detail", id = "", name = "" },  // Parameter defaults
                new string[] { "Jumblist.Website.Controllers" }
            );

            routes.MapRoute(
                "Category",                                              // Route name
                "{controller}/{action}/{id}/{category}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "", category = "" },  // Parameter defaults
                new string[] { "Jumblist.Website.Controllers" }
            );

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" },  // Parameter defaults
                new string[] { "Jumblist.Website.Controllers" }
            );
        }

        public static void RegisterViewEngines( ViewEngineCollection engines )
        {
            if (engines == null) throw new ArgumentNullException( "engines" );

            //SparkEngineStarter.RegisterViewEngine( engines );
        }

        public static void RegisterModelBinders()
        {
            var binders = ModelBinders.Binders;

            //binders.DefaultBinder = new SomeCustomDefaultBinder();

            binders[typeof(Basket)] = new BasketModelBinder();
            binders[typeof(User)] = new UserModelBinder();
        }

        //protected void Application_AuthenticateRequest( object sender, EventArgs e )
        //{
        //    if (HttpContext.Current.User == null) return;
        //    if (!HttpContext.Current.User.Identity.IsAuthenticated) return;

        //    HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            
        //    if (authCookie != null) return;

        //    //Extract the forms authentication cookie
        //    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt( authCookie.Value );

        //    string[] roles = authTicket.UserData.Split( new Char[] { '|' } );

        //    GenericIdentity userIdentity = new GenericIdentity( authTicket.Name );

        //    User userIdentity = new User();
        //    userIdentity.Name = authTicket.Name;
        //    userIdentity.Postcode = authTicket.UserData;

        //    //CustomPrincipal implements System.Web.Security.IPrincipal
        //    GenericPrincipal userPrincipal = new GenericPrincipal( userIdentity.Identity, roles );

        //    //Context.User = userPrincipal;
        //    HttpContext.Current.User = userPrincipal;
        //}


        //protected void Application_AuthenticateRequest( object sender, EventArgs e )
        //{

        //    //if (Context.User == null) return;
        //    //if (!Context.User.Identity.IsAuthenticated) return;

        //    if (Context.User == null)
        //    {
        //        GenericPrincipal anonPrincipal = new GenericPrincipal( Jumblist.Core.Model.User.Anonymous, new string[] {} );
        //        Context.User = anonPrincipal;
        //        return;
        //    }


        //    // Get the authentication cookie
        //    string cookieName = FormsAuthentication.FormsCookieName;
        //    HttpCookie authCookie = Context.Request.Cookies[cookieName];

        //    // If the cookie can't be found, don't issue the ticket
        //    if (authCookie == null) return;

        //    // Get the authentication ticket and rebuild the GenericPrincipal principal & Jumblist User identity
        //    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt( authCookie.Value );

        //    string[] roles = new string[] {};

        //    //XmlSerializer s = new XmlSerializer( typeof( User ) );
        //    //User user = (User)s.Deserialize( new StringReader( authTicket.UserData ) );

        //    DataContractSerializer dcs = new DataContractSerializer( typeof( User ) );
        //    XmlReader reader = XmlReader.Create( new StringReader( authTicket.UserData ) );
        //    User user = (User)dcs.ReadObject( reader, true );

        //    //User user = new User();
        //    //user.Name = authTicket.Name;
        //    //user.IsAuthenticated = true;
        //    //user.Postcode = authTicket.UserData;

        //    GenericPrincipal userPrincipal = new GenericPrincipal( user, roles );
        //    Context.User = userPrincipal;
        //}


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