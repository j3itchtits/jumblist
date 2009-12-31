using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Web.Routing;
using System.Reflection;
using Castle.Windsor;
using Castle.MicroKernel.Registration;
using Castle.Core;
using System.Runtime.CompilerServices;
using JumblistTest.Core.Service;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Service;
using JumblistTest.Website.Filter;
using JumblistTest.Website.IoC;

namespace JumblistTest.Website
{
    public class JumblistApplication
    {
        private static readonly string jumblistDbConnString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public static void RegisterComponents( IWindsorContainer container )
        {
            AddControllers( container );
            AddComponents( container );
            //AddServices( container );
            //AddRepositories( container );
        }

        //add all my controllers
        private static void AddControllers( IWindsorContainer container )
        {
            container.Register(
                AllTypes.Of<IController>().FromAssembly( Assembly.GetExecutingAssembly() ).Configure( c => c.LifeStyle.Transient )
            );

            //container.Register(
            //    AllTypes.FromAssembly( Assembly.GetExecutingAssembly() ).BasedOn<IController>()
            //);
        }

        //handle any one off registrations that aren't convention based
        private static void AddComponents( IWindsorContainer container )
        {
            container.Register(
                Component.For<IDataContextProvider>().ImplementedBy<DataContextProvider>().LifeStyle.PerWebRequest,
                Component.For<IConnectionStringProvider>().ImplementedBy<ConnectionStringProvider>().LifeStyle.Transient.Parameters( Parameter.ForKey( "connectionString" ).Eq( jumblistDbConnString ) ),
                Component.For( typeof( IRepository<> ) ).ImplementedBy( typeof( Repository<> ) ).LifeStyle.Transient,
                Component.For( typeof( IDataService<> ) ).ImplementedBy( typeof( DataService<> ) ).LifeStyle.Transient,
                Component.For<IDataServiceResolver>().ImplementedBy<DataServiceResolver>().LifeStyle.Transient,
                Component.For<IFormsAuthenticationService>().ImplementedBy<FormsAuthenticationService>().LifeStyle.Transient,
                Component.For<IUserService>().ImplementedBy<UserService>().LifeStyle.Transient,
                Component.For<IActionInvoker>().ImplementedBy<WindsorActionInvoker>().LifeStyle.Singleton,
                Component.For<IFeedService>().ImplementedBy<FeedService>().LifeStyle.Transient
            );


            //container.Register( AllTypes.Pick()
            //    .FromAssembly( Assembly.GetExecutingAssembly() )
            //    .Configure( c => c.LifeStyle.Transient )
            //    .WithService.FirstInterface()
            //);

            //container.Register( Component.For<IPostRepository>()
            //    .ImplementedBy<SqlPostRepository>()
            //    .LifeStyle.PerWebRequest
            //    .Parameters( Parameter.ForKey( "connectionString" ).Eq( jumblistDbConnString ) )
            //);


        }

        //register my application services
        private static void AddServices( IWindsorContainer container )
        {

        }

        //register all custom repositories (not generic)
        //http://blog.coreycoogan.com/2009/11/06/castle-windsor-tutorial-in-asp-net-mvc/
        //http://code-magazine.com/article.aspx?quickid=0906051&page=3
        private static void AddRepositories( IWindsorContainer container )
        {
 
        }

        public static void RegisterRoutes( RouteCollection routes )
        {
            if ( routes == null ) throw new ArgumentNullException( "routes" );

            routes.IgnoreRoute( "{resource}.axd/{*pathInfo}" );

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Pages", action = "Index", id = "" }  // Parameter defaults
            );

        }

        public static void RegisterViewEngines( ViewEngineCollection engines )
        {
            if ( engines == null ) throw new ArgumentNullException( "engines" );

            //SparkEngineStarter.RegisterViewEngine( engines );
        }

        public static void RegisterModelBinders()
        {
            var binders = ModelBinders.Binders;

        }
    }
}
