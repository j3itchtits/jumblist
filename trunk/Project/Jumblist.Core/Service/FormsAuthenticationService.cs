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

        public void SetAuthCookie( string name, bool createPersistentCookie )
        {
            FormsAuthentication.SetAuthCookie( name, createPersistentCookie );
        }

        public string HashPasswordForStoringInConfigFile( string password )
        {
            return FormsAuthentication.HashPasswordForStoringInConfigFile( password, "SHA1" );
        }
    }
}