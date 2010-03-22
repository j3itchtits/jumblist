using System;
using System.Security.Principal;
using System.Linq.Expressions;

namespace Jumblist.Core.Model
{
    public partial class User : IIdentity
    {


        public static User Anonymous { get { return new User() { UserId = (int)UserUniqueId.Anonymous, Name = Enum.Format( typeof( UserUniqueId ), UserUniqueId.Anonymous, "g" ) }; } }
        public static User Administrator { get { return new User() { UserId = (int)UserUniqueId.Administrator, Name = Enum.Format( typeof( UserUniqueId ), UserUniqueId.Administrator, "g" ) }; } }

        public static Expression<Func<User, bool>> WhereNameEquals( string name )
        {
            return x => x.Name == name;
        }

        public static Expression<Func<User, bool>> WhereNamePasswordEquals( string name, string password )
        {
            return u => (u.Name == name && u.Password == password && u.IsActive);
        }

        public static Expression<Func<User, bool>> WhereEmailEquals( string email )
        {
            return x => x.Email == email;
        }

        public static Expression<Func<User, bool>> WhereEquals( User user )
        {
            return x => x.UserId == user.UserId;
        }

        public static Expression<Func<User, bool>> WhereNotEquals( User user )
        {
            return x => x.UserId != user.UserId;
        }


        //#region IPrincipal Members

        //public IIdentity Identity
        //{
        //    get 
        //    { 
        //        bool isAuthenticated = (this != null);
        //        User user = isAuthenticated ? this : User.Anonymous;
        //        user.IsAuthenticated = isAuthenticated;
        //        return (IIdentity)user;
        //    }
        //}

        //public bool IsInRole( string role )
        //{
        //    return this.Role.Name == role;
        //}

        //#endregion

        #region IIdentity Members

        public string AuthenticationType
        {
            get { return "FormsAuth"; }
        }

        public bool IsAuthenticated { get; set; }

        #endregion
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

    [Serializable]
    [Flags]
    public enum UserUniqueId
    {
        Anonymous = 15,
        Administrator = 10
    }
}
