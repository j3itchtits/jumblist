using System;
using System.Security.Principal;

namespace JumblistTest.Core.Model
{
    public partial class User
    {

    }

    //public partial class User : IPrincipal
    //{
    //    public IIdentity Identity
    //    {
    //        get
    //        {
    //            bool isAuthenticated = (this != null);
    //            return new Identity( isAuthenticated, this.Email );
    //        }
    //    }

    //    public bool IsInRole( string role )
    //    {
    //        return this.Role.Name == role;
    //    }

    //    public bool IsAdministrator { get { return RoleId == Role.AdministratorId; } }
    //    public bool IsAuthor { get { return RoleId == Role.AuthorId; } }

    //}

    ///// <summary>
    ///// Simple implementation of IIdentity
    ///// </summary>
    //public class Identity : IIdentity
    //{
    //    bool isAuthenticated;
    //    string name;

    //    public Identity( bool isAuthenticated, string name )
    //    {
    //        this.isAuthenticated = isAuthenticated;
    //        this.name = name;
    //    }

    //    public string AuthenticationType
    //    {
    //        get { return "Forms"; }
    //    }

    //    public bool IsAuthenticated
    //    {
    //        get { return isAuthenticated; }
    //    }

    //    public string Name
    //    {
    //        get { return name; }
    //    }
    //}
}
