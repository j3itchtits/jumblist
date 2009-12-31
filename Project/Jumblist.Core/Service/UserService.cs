using JumblistTest.Core.Model;
using System.Collections.Generic;
using StuartClode.Mvc.Repository;
using System.Linq;
using StuartClode.Mvc.Service;
using System.Web;
using System;

namespace JumblistTest.Core.Service
{
    public class UserService : DataService<User>, IUserService
    {
        private readonly IRepository<User> repository;
        private readonly IFormsAuthenticationService formsAuth;

        public UserService( IRepository<User> repository, IFormsAuthenticationService formsAuth )
            : base( repository )
        {
            this.repository = repository;
            this.formsAuth = formsAuth;
        }

        #region IUserService Members

        public User RegisterUser( string name, string email, string password )
        {
            var user = new User
            {
                Name = name,
                Email = email,
                Password = HashPassword( password ),
                IsActive = true,
                DateCreated = DateTime.Now,
                RoleId = Role.AuthorId
            };

            Save( user );

            return user;
        }

        //public virtual User CurrentUser
        //{
        //    get
        //    {
        //        var user = HttpContext.Current.User as User;
        //        if (user == null) throw new ApplicationException( "HttpContext.User is not a Jumblist.Website.Model.User" );
        //        return user;
        //    }
        //}

        public User GetUser( string email, string password )
        {
            return repository.SelectList().SingleOrDefault( u => u.Email == email && u.Password == password && u.IsActive );
        }

        public User GetUser( string email )
        {
            return repository.SelectList().SingleOrDefault( u => u.Email == email );
        }

        public virtual void SetAuthenticationCookie( string email, bool rememberMe )
        {
            formsAuth.SetAuthCookie( email, rememberMe );
        }

        //public virtual void SetContextUserTo( User user )
        //{
        //    System.Threading.Thread.CurrentPrincipal = HttpContext.Current.User = user;
        //}

        public virtual void RemoveAuthenticationCookie()
        {
            formsAuth.SignOut();
        }

        public string HashPassword( string password )
        {
            return formsAuth.HashPasswordForStoringInConfigFile( password );
        }

        public bool Authenticate( string email, string password )
        {
            return GetUser( email, HashPassword( password ) ) != null;
        }


        #endregion
    }
}
