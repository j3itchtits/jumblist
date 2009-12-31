using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Service;
using System.Security.Principal;
using Jumblist.Core.Model;

namespace Jumblist.Website.Filter
{
    [AttributeUsage( AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true )]
    public class CustomAuthorizationAttribute : AuthorizeAttribute
    {
        public IUserService UserService { get; set; }
        public RoleLevels RoleLevel { get; set; }

        protected override bool AuthorizeCore( HttpContextBase httpContext )
        {
            var userAuth = base.AuthorizeCore( httpContext );

            if (!userAuth)
                return false;

            var user = UserService.GetUser( httpContext.User.Identity.Name );

            var userRole = user.Role.Level;

            if (userRole != (int)RoleLevel)
                return false;

            return true;

        }
    }
}
