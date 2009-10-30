using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Website.Services.Authentication
{
    public interface IFormsAuthentication
    {
        bool Authenticate( string userName, string password );
        void SignIn( string userName, bool createPersistentCookie );
        void SignOut();
    }
}
