using Jumblist.Core.Model;
using System.Collections.Generic;
using StuartClode.Mvc.Service.Data;
using System.Linq;
using System.Linq.Expressions;
using System;
using System.Web;

namespace Jumblist.Core.Service
{
    public interface IUserService
    {
        IQueryable<User> SelectRecordList();
        IQueryable<User> SelectRecordList( Expression<Func<User, bool>> whereCondition );
        User SelectRecord( int id );
        User SelectRecord( Expression<Func<User, bool>> whereCondition );
        User SelectRecord( string name );
        void Save( User entity );
        void Update(User entity);
        void ResetPassword( User entity, string password, string confirmPassword );
        void Create( User entity, string confirmPassword );
        void SetAuthenticationCookie( User user, bool rememberMe );
        void RemoveAuthenticationCookie();
        string HashPassword( string password );
        User Authenticate( string name, string password );
        void Delete( User entity );
        HttpCookie CreateAuthenticationCookie(User user, DateTime timeout);
        //User DeserializeAuthenticationCookie(string cookieValue);
        void SaveSession( UserSession userSession );
    }
}
