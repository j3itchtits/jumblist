using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;

namespace Jumblist.Website.Services.Authentication
{
    public class FormsAuthenticationService : IFormsAuthentication
    {
        public bool Authenticate( string userName, string password )
        {
            return FormsAuthentication.Authenticate( userName, password );
        }

        public void SignIn( string userName, bool createPersistentCookie )
        {
            FormsAuthentication.SetAuthCookie( userName, createPersistentCookie );
        }
        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }
    }
}
