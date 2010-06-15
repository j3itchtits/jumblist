using System;
using System.Security.Principal;
using System.Linq.Expressions;
using System.Runtime.Serialization;

namespace Jumblist.Core.Model
{
    public partial class User
    {
        public static User Anonymous 
        { 
            get 
            { 
                return new User() { UserId = (int)UserUniqueId.Anonymous, IsAuthenticated = false, Name = Enum.Format( typeof( UserUniqueId ), UserUniqueId.Anonymous, "g" ), Role = Role.AnonymousUser, Session = new UserSession()}; 
            } 
        }
        //public static User Administrator { get { return new User() { UserId = (int)UserUniqueId.Administrator, IsAuthenticated = true, Name = Enum.Format( typeof( UserUniqueId ), UserUniqueId.Administrator, "g" ) }; } }

        public UserSession Session { get; set; }

        [DataMember]
        public bool IsAuthenticated { get; set; }

        public static Expression<Func<User, bool>> WhereNameEquals( string name )
        {
            return x => x.Name == name;
        }

        public static Expression<Func<User, bool>> WhereNamePasswordEquals( string name, string password )
        {
            return u => (u.Name == name && u.Password == password && u.IsActive);
        }

        public static Expression<Func<User, bool>> WhereEmailPasswordEquals( string email, string password )
        {
            return u => (u.Email == email && u.Password == password && u.IsActive);
        }

        public static Expression<Func<User, bool>> WhereEmailEquals( string email )
        {
            return x => x.Email == email;
        }

        public static Expression<Func<User, bool>> CheckForUnverifiedUser( int id, string email )
        {
            return u => (u.UserId == id && u.Email == email && !u.IsActive);
        }

        public static Expression<Func<User, bool>> WhereEquals( User user )
        {
            return x => x.UserId == user.UserId;
        }

        public static Expression<Func<User, bool>> WhereNotEquals( User user )
        {
            return x => x.UserId != user.UserId;
        }
    }

    [Serializable]
    [Flags]
    public enum UserUniqueId
    {
        Anonymous = 15,
        Administrator = 10
    }
}
