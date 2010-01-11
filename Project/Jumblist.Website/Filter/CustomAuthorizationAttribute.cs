using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Service;
using System.Security.Principal;
using Jumblist.Core.Model;
using Jumblist.Website.Extension;

namespace Jumblist.Website.Filter
{
    public class CustomAuthorizationAttribute : AuthorizeAttribute
    {
        public IUserService UserService { get; set; }
        public RoleLevel RoleLevelMinimum { get; set; }
        public RoleLevel RoleLevels { get; set; }
        private bool failedRolesAuth = false;

        protected override bool AuthorizeCore( HttpContextBase httpContext )
        {
            var userAuth = base.AuthorizeCore( httpContext );

            if ( !userAuth )
            {
                return false;
            }

            var user = UserService.GetUser( httpContext.User.Identity.Name );

            if ( ( RoleLevelMinimum > 0 ) && ( user.Role.Level > (int)RoleLevelMinimum ) )
            {
                //throw new UnauthorizedAccessException( "You are not authorized to view this page" );
                failedRolesAuth = true;
                return false;
            }

            if ( ( RoleLevels > 0 ) && !( RoleLevels.Has( user.Role.Level ) ) )
            {
                //throw new UnauthorizedAccessException( "You are not authorized to view this page" );
                failedRolesAuth = true;
                return false;
            }

            return true;

        }

        public override void OnAuthorization( AuthorizationContext filterContext )
        {
            base.OnAuthorization( filterContext );

            if ( failedRolesAuth )
            {
                //throw new UnauthorizedAccessException( "You are not authorized to view this page" );
                ViewDataDictionary viewData = new ViewDataDictionary();
                viewData.Add( "Message", "You do not have sufficient privileges for this operation." );
                filterContext.Result = new ViewResult { ViewName = "Error", ViewData = viewData };
            }
        }
    }
}
