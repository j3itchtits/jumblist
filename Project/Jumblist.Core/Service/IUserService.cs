﻿using Jumblist.Core.Model;
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
        void Save( User user );
        void Save( User user, bool isDetachedFromDatabase );
        void Delete( User user );
        User Create( User user, string confirmPassword );
        void SetAuthenticationCookie( User user, bool rememberMe );
        void RemoveAuthenticationCookie();
        void ResetAuthenticationCookie( User user, bool rememberMe );
        void ResetPassword( User user, string password, string confirmPassword ); 
        string HashPassword( string password );
        string GenerateRandomPassword();
        User Authenticate( string name, string password );
        bool VerifyRegistration( int id, string email );
    }
}
