using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Principal;
using System.Runtime.InteropServices;

namespace Jumblist.Core.Model
{
    [Serializable]
    public class UserIdentity : IIdentity
    {
        bool isAuthenticated;
        string name;

        public UserIdentity(bool isAuthenticated, string name)
        {
            this.isAuthenticated = isAuthenticated;
            this.name = name;
        }

        #region IIdentity Members

        public string AuthenticationType
        {
            get { return "FormsAuth"; }
        }

        public bool IsAuthenticated
        {
            get { return isAuthenticated; }
        }

        public string Name
        {
            get { return name; }
        }

        #endregion
    }

    [Serializable]
    [ComVisible(true)]
    public class UserIdentity2 : GenericIdentity
    {
        public UserIdentity2( string name ) : base( name )
        {
        }
    }
}
