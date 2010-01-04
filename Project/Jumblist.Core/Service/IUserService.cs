using Jumblist.Core.Model;
using System.Collections.Generic;
using StuartClode.Mvc.Service;

namespace Jumblist.Core.Service
{
    public interface IUserService : IDataService<User>
    {
        User RegisterUser( string name, string email, string postcode, string password, string confirmpassword );
        //User CurrentUser { get; }
        User GetUser( string email );
        User GetUser( string email, string password );
        void SetAuthenticationCookie( string email, bool rememberMe );
        //void SetContextUserTo( User user );
        void RemoveAuthenticationCookie();
        string HashPassword( string password );
        bool Authenticate( string email, string password );
        void EnsureValid( string name, string email, string password, string confirmpassword );
    }
}
