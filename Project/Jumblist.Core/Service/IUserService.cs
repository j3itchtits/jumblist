using Jumblist.Core.Model;
using System.Collections.Generic;
using StuartClode.Mvc.Service;

namespace Jumblist.Core.Service
{
    public interface IUserService : IDataService<User>
    {
        void SaveUser( User entity );
        void CreateUser( string name, string email, string password, string confirmpassword, int roleId );
        void RegisterUser( string name, string email, string postcode, string password, string confirmpassword );
        //User CurrentUser { get; }
        User GetUser( string name );
        User GetUser( string name, string password );
        void SetAuthenticationCookie( string name, bool rememberMe );
        //void SetContextUserTo( User user );
        void RemoveAuthenticationCookie();
        string HashPassword( string password );
        bool Authenticate( string name, string password );
    }
}
