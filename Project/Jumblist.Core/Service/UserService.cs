using Jumblist.Core.Model;
using System.Collections.Generic;
using StuartClode.Mvc.Repository;
using System.Linq;
using StuartClode.Mvc.Service;
using System.Web;
using System;
using xVal.ServerSide;

namespace Jumblist.Core.Service
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

        public void SaveUser( User entity )
        {
            ValidateBusinessRules( entity );

            var savedUser = Select( entity.UserId );
            entity.Password = savedUser.Password;
            
            base.Save( entity );
        }

        public void RegisterUser( string name, string email, string postcode, string password, string confirmpassword )
        {
            ValidateBusinessRules( name, email, password, confirmpassword );

            var user = new User
            {
                Name = name,
                Email = email,
                Postcode = postcode.ToUpper(),
                Password = HashPassword( password ),
                IsActive = true,
                DateCreated = DateTime.Now,
                RoleId = Role.AuthorId
            };

            base.Save( user );
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

        public User GetUser( string name, string password )
        {
            return repository.SelectList().SingleOrDefault( u => u.Name == name && u.Password == password && u.IsActive );
        }

        public User GetUser( string name )
        {
            return repository.SelectList().SingleOrDefault( u => u.Name == name );
        }

        public virtual void SetAuthenticationCookie( string name, bool rememberMe )
        {
            formsAuth.SetAuthCookie( name, rememberMe );
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

        public bool Authenticate( string name, string password )
        {
            return GetUser( name, HashPassword( password ) ) != null;
        }

        

        #endregion

        private void ValidateBusinessRules( string name, string email, string password, string confirmpassword )
        {
            ValidatePasswords( password, confirmpassword );
            ValidateDuplicates( SelectList(), name, email );
        }

        private void ValidateBusinessRules( User entity )
        {
            IQueryable<User> list;

            if (entity.UserId == 0)
                list = SelectList();
            else
                list = SelectList().Where( u => u.UserId != entity.UserId );

            ValidateDuplicates( list, entity.Name, entity.Email );
        }

        private void ValidatePasswords( string password, string confirmpassword )
        {
            if (string.IsNullOrEmpty( password ))
                throw new RulesException( "password", "You must enter a password", "user" );

            if (password.Length < 6)
                throw new RulesException( "password", "Password must be at least 6 characters", "user" );

            if (password != confirmpassword)
                throw new RulesException( "confirmpassword", "The passwords must be the same", "user" );
        }

        private void ValidateDuplicates( IQueryable<User> list, string name, string email )
        {
            if (list.Any<User>( u => u.Name == name ))
                throw new RulesException( "name", "Username already taken", "user" );

            if (list.Any<User>( u => u.Email == email ))
                throw new RulesException( "email", "Email already taken", "user" );
        }
    }
}
