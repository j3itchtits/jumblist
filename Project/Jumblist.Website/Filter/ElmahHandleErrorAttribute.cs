using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Elmah;

namespace Jumblist.Website.Filter
{
    public class ElmahHandleErrorAttribute : HandleErrorAttribute
    {
        public override void OnException( ExceptionContext context )
        {
            //base.OnException( context );

            if ( context == null )
            {
                throw new ArgumentNullException( "filterContext" );
            }

            // If custom errors are disabled, we need to let the normal ASP.NET exception handler
            // execute so that the user can see useful debugging information.
            if ( context.ExceptionHandled || !context.HttpContext.IsCustomErrorEnabled )
            {
                return;
            }

            Exception exception = context.Exception;

            // If this is not an HTTP 500 (for example, if somebody throws an HTTP 404 from an action method),
            // ignore it.
            if ( new HttpException( null, exception ).GetHttpCode() != 500 )
            {
                return;
            }

            if ( !ExceptionType.IsInstanceOfType( exception ) )
            {
                return;
            }

            string controllerName = (string)context.RouteData.Values["controller"];
            string actionName = (string)context.RouteData.Values["action"];
            HandleErrorInfo model = new HandleErrorInfo( context.Exception, controllerName, actionName );
            context.Result = new ViewResult
            {
                ViewName = View,
                MasterName = Master,
                ViewData = new ViewDataDictionary<HandleErrorInfo>( model ),
                TempData = context.Controller.TempData
            };
            context.ExceptionHandled = true;
            context.HttpContext.Response.Clear();
            context.HttpContext.Response.StatusCode = 500;

            // Certain versions of IIS will sometimes use their own error page when
            // they detect a server error. Setting this property indicates that we
            // want it to try to render ASP.NET MVC's error page instead.
            context.HttpContext.Response.TrySkipIisCustomErrors = true;


            //Elmah specific code

            var e = context.Exception;
            if ( !context.ExceptionHandled   // if unhandled, will be logged anyhow
                || RaiseErrorSignal( e )      // prefer signaling, if possible
                || IsFiltered( context ) )     // filtered?
                return;

            LogException( e );
        }

        private static bool RaiseErrorSignal( Exception e )
        {
            var context = HttpContext.Current;
            if ( context == null )
                return false;

            var signal = ErrorSignal.FromContext( context );
            if ( signal == null )
                return false;

            signal.Raise( e, context );
            return true;
        }

        private static bool IsFiltered( ExceptionContext context )
        {
            var config = context.HttpContext.GetSection( "elmah/errorFilter" ) as ErrorFilterConfiguration;

            if ( config == null )
                return false;

            var testContext = new ErrorFilterModule.AssertionHelperContext( context.Exception, HttpContext.Current );

            return config.Assertion.Test( testContext );
        }

        private static void LogException( Exception e )
        {
            var context = HttpContext.Current;
            ErrorLog.GetDefault( context ).Log( new Error( e, context ) );
        }

    }
}
