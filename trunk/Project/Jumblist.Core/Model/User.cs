using System;
using System.Security.Principal;
using System.Linq.Expressions;
using System.Runtime.Serialization;

namespace Jumblist.Core.Model
{
    //[Serializable]
    public partial class User : MarshalByRefObject, IIdentity
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

        #region IIdentity Members

        public string AuthenticationType
        {
            get { return "FormsAuth"; }
        }
        [DataMember]
        public bool IsAuthenticated { get; set; }

        #endregion
    }

    [Serializable]
    [Flags]
    public enum UserUniqueId
    {
        Anonymous = 15,
        Administrator = 10
    }
}
