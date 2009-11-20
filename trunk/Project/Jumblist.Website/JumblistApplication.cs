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
using Jumblist.Core.Service;
using Jumblist.Services.Basket;
using Jumblist.Data.Access;
using Jumblist.Data.Entity;
using Jumblist.Website.ModelBinder;
using MvcContrib.Castle;
using Castle.Core;
using System.Runtime.CompilerServices;

namespace Jumblist.Website
{
    public class JumblistApplication
    {
        private readonly string jumblistDbConnString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

        public void RegisterComponents( IWindsorContainer container )
        {
            AddControllers( container );
            AddSingleComponents( container );
            //AddServices( container );
            AddRepositories( container );
        }

        //add all my controllers
        private void AddControllers( IWindsorContainer container )
        {
            container.RegisterControllers( Assembly.GetExecutingAssembly() );

            //container.Register( AllTypes
            //   .Of<IController>()
            //   .FromAssembly( Assembly.GetExecutingAssembly() )
            //   .Configure( c => c.LifeStyle.Transient.Named( c.Implementation.Name.ToLower() ) ) );

            //Also register all the controller types as transient
            //var controllerTypes = from t in Assembly.GetExecutingAssembly().GetTypes()
            //                      where typeof( IController ).IsAssignableFrom( t )
            //                      select t;
            //foreach (Type t in controllerTypes)
            //    container.AddComponentLifeStyle( t.FullName, t, LifestyleType.Transient );
        }

        //handle any one off registrations that aren't convention based
        private void AddSingleComponents( IWindsorContainer container )
        {

          
            //container.Register( Component.For<IPostRepository>()
            //    .Named( "PostRepository" )
            //    .ImplementedBy<SqlPostRepository>()
            //    .LifeStyle.PerWebRequest
            //    .Parameters( Parameter.ForKey( "connectionString" ).Eq( jumblistDbConnString ) )
            //);

            //container.Register( Component.For<IPostCategoryRepository>()
            //    .Named( "PostCategoryRepository" )
            //    .ImplementedBy<SqlPostCategoryRepository>()
            //    .LifeStyle.PerWebRequest
            //    .Parameters( Parameter.ForKey( "connectionString" ).Eq( jumblistDbConnString ) )
            //);

            container.Register( Component.For<IBasketSubmitter>()
                .Named( "BasketSubmitterService" )
                .ImplementedBy<EmailBasketSubmitter>()
                .LifeStyle.PerWebRequest
                .Parameters( 
                    Parameter.ForKey( "smtpServer" ).Eq( "127.0.0.1" ),
                    Parameter.ForKey( "mailFrom" ).Eq( "stuartclode@idnet.com" ),
                    Parameter.ForKey( "mailTo" ).Eq( "stuartclode@idnet.com" ) 
                )
            );
        }

        //register my application services
        private void AddServices( IWindsorContainer container )
        {
            container.Register( AllTypes.Pick()
                .FromAssemblyNamed( "Jumblist.Services" )
                .Configure( c => c.LifeStyle.PerWebRequest )
                .WithService.FirstNonGenericCoreInterface( "Jumblist.Core" ) //look for interfaces from this assembly
                
            );
        }

        //register all custom repositories (not generic)
        //http://blog.coreycoogan.com/2009/11/06/castle-windsor-tutorial-in-asp-net-mvc/
        //http://code-magazine.com/article.aspx?quickid=0906051&page=3
        private void AddRepositories( IWindsorContainer container )
        {
            container.Register( AllTypes.Pick()
                .FromAssemblyNamed( "Jumblist.Data" )
                .Configure( c => c.LifeStyle.PerWebRequest )
                .Configure( c => c.DependsOn( new { connectionString = jumblistDbConnString } ) )
                .WithService.FirstInterface()
            );
        }

        public void RegisterRoutes( RouteCollection routes )
        {
            if ( routes == null ) throw new ArgumentNullException( "routes" );

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

        public void RegisterViewEngines( ViewEngineCollection engines )
        {
            if ( engines == null ) throw new ArgumentNullException( "engines" );

            //SparkEngineStarter.RegisterViewEngine( engines );
        }

        public void RegisterModelBinders()
        {
            var binders = ModelBinders.Binders;

            binders[typeof( Basket )] = new BasketModelBinder();
        }
    }

    public static class WindsorExtensions
    {
        /// <summary>
        /// Searches for the first interface found associated with the 
        /// <see cref="ServiceDescriptor" /> which is not generic and which 
        /// is found in the specified namespace.
        /// </summary>
        public static BasedOnDescriptor FirstNonGenericCoreInterface( this ServiceDescriptor descriptor, string interfaceNamespace )
        {
            return descriptor.Select( delegate( Type type, Type baseType )
            {
                var interfaces = type.GetInterfaces()
                    .Where( t => t.IsGenericType == false && t.Namespace.StartsWith( interfaceNamespace ) );

                if (interfaces.Count() > 0)
                {
                    return new[] { interfaces.ElementAt( 0 ) };
                }

                return null;
            } );
        }
    }
}
