using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StuartClode.Mvc.Service;
using JumblistTest.Core.Model;
using JumblistTest.Core.Service;
using System.Threading;

namespace JumblistTest.Website.Filter
{
    public class CustomAuthenticationAttribute : FilterAttribute, IAuthorizationFilter
    {
        public IUserService UserService { get; set; }

        #region IAuthorizationFilter Members

        public void OnAuthorization( AuthorizationContext filterContext )
        {
            var context = filterContext.HttpContext;

            if ( context.User != null && context.User.Identity.IsAuthenticated ) 
            {
                var email = context.User.Identity.Name;
                var user = UserService.GetUser( email );

                if (user == null)
                {
                    UserService.RemoveAuthenticationCookie();
                }
                else
                {
                    Thread.CurrentPrincipal = context.User = user;
                }
            }
        }

        #endregion
    }
}
