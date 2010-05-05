using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Service;
using System.Security.Principal;
using Jumblist.Core.Model;
using StuartClode.Mvc.Extension;
using Microsoft.Practices.ServiceLocation;
using System.Web.Routing;

namespace Jumblist.Website.Filter
{
    public class CustomAuthorizationAttribute : AuthorizeAttribute
    {
        public IUserService UserService { get; set; }
        public RoleLevel RoleLevelMinimum { get; set; }
        public RoleLevel RoleLevels { get; set; }

        protected override bool AuthorizeCore( HttpContextBase httpContext )
        {
            //Basic user authentication
            var userAuth = base.AuthorizeCore( httpContext );

            if ( !userAuth ) return false;

            //Custom user authorisation against assigned roles
            var user = UserService.SelectRecord( httpContext.User.Identity.Name );

            if ( ( RoleLevelMinimum > 0 ) && ( user.Role.Level > (int)RoleLevelMinimum ) )
            {
                return false;
            }

            if ( ( RoleLevels > 0 ) && !( RoleLevels.Has( user.Role.Level ) ) )
            {
                return false;
            }

            //User is authenticated and authorised to view the requested controller/action
            return true;

        }

        public override void OnAuthorization( AuthorizationContext filterContext )
        {
            if ( filterContext == null )
            {
                throw new ArgumentNullException( "filterContext" );
            }

            if ( AuthorizeCore( filterContext.HttpContext ) )
            {
                // ** IMPORTANT **
                // Since we're performing authorization at the action level, the authorization code runs
                // after the output caching module. In the worst case this could allow an authorized user
                // to cause the page to be cached, then an unauthorized user would later be served the
                // cached page. We work around this by telling proxies not to cache the sensitive page,
                // then we hook our custom authorization code into the caching mechanism so that we have
                // the final say on whether a page should be served from the cache.

                HttpCachePolicyBase cachePolicy = filterContext.HttpContext.Response.Cache;
                cachePolicy.SetProxyMaxAge( new TimeSpan( 0 ) );
                cachePolicy.AddValidationCallback( CacheValidateHandler, null /* data */);
            }
            else
            {
                // auth failed, redirect to not authorized page
                ViewDataDictionary viewData = new ViewDataDictionary();
                viewData.Add( "PageTitle", "Not Authorized" );
                viewData.Add( "Message", "Sorry, you do not have sufficient privileges for this operation." );

                filterContext.Result = new ViewResult { ViewName = "Error",  ViewData = viewData };
                //filterContext.Result = new RedirectToRouteResult( new RouteValueDictionary( new { area = "", controller = "Home" } ) );
            }
        }

        private void CacheValidateHandler( HttpContext context, object data, ref HttpValidationStatus validationStatus )
        {
            validationStatus = OnCacheAuthorization( new HttpContextWrapper( context ) );
        }
    }
}
