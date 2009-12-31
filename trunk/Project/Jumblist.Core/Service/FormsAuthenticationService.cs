using System;
using System.Web.Security;

namespace Jumblist.Core.Service
{
    public class FormsAuthenticationService : IFormsAuthenticationService
    {
        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }

        public void SetAuthCookie( string email, bool createPersistentCookie )
        {
            FormsAuthentication.SetAuthCookie( email, createPersistentCookie );
        }

        public string HashPasswordForStoringInConfigFile( string password )
        {
            return FormsAuthentication.HashPasswordForStoringInConfigFile( password, "SHA1" );
        }
    }
}