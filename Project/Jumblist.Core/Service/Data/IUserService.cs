using Jumblist.Core.Model;
using System.Collections.Generic;
using StuartClode.Mvc.Service.Data;
using System.Linq;

namespace Jumblist.Core.Service.Data
{
    public interface IUserService
    {
        void Save( User entity );
        void ResetPassword( User entity, string password, string confirmPassword );
        void Create( User entity, string confirmPassword );
        IQueryable<User> SelectList();
        User Select( int id );
        User Select( string name );
        User Select( string name, string password );
        void SetAuthenticationCookie( string name, bool rememberMe );
        //void SetContextUserTo( User user );
        void RemoveAuthenticationCookie();
        string HashPassword( string password );
        bool Authenticate( string name, string password );
        void Delete( User entity );
    }
}
