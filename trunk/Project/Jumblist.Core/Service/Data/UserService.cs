using System.Collections.Generic;
using System.Linq;
using System.Web;
using System;
using xVal.ServerSide;
using Jumblist.Core.Model;
using Jumblist.Core.Service.Authentication;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Validation;
using StuartClode.Mvc.Service.Bing;

namespace Jumblist.Core.Service.Data
{
    public class UserService : DataService<User>, IUserService
    {
        private readonly IFormsAuthenticationService formsAuth;

        public UserService( IRepository<User> repository, IFormsAuthenticationService formsAuth )
            : base( repository )
        {
            this.formsAuth = formsAuth;
        }

        #region IUserService Members

        public override void Save( User entity )
        {
            var bingLocationService = new BingLocationService( entity.Postcode );

            entity.Latitude = bingLocationService.Latitude;
            entity.Longitude = bingLocationService.Longitude;

            ValidateDataRules( entity );
            ValidateBusinessRules( entity );

            base.Save( entity );
        }

        public void ResetPassword( User entity, string password, string confirmPassword )
        {
            ValidateBusinessRules( password, confirmPassword );
            entity.Password = HashPassword( password );

            base.Update( entity );
        }

        public void Create( User entity, string confirmPassword )
        {
            var bingLocationService = new BingLocationService( entity.Postcode.ToUpper() );

            string password = entity.Password;

            entity.SearchRadiusMiles = 5;
            entity.Postcode = entity.Postcode.ToUpper();
            entity.Latitude = bingLocationService.Latitude;
            entity.Longitude = bingLocationService.Longitude;
            entity.Password = HashPassword( password );
            entity.IsActive = true;
            entity.DateCreated = DateTime.Now;

            ValidateDataRules( entity );
            ValidateBusinessRules( entity.Name, entity.Email, password, confirmPassword );

            base.Save( entity );
        }

        public override IQueryable<User> SelectList()
        {
            return base.SelectList();
        }

        public override User Select( int id )
        {
            return base.Select( id );
        }

        public User Select( string name, string password )
        {
            return SelectList().SingleOrDefault( u => u.Name == name && u.Password == password && u.IsActive );
        }

        public override User Select( string name )
        {
            return base.Select( name );
        }

        public virtual void SetAuthenticationCookie( string name, bool rememberMe )
        {
            formsAuth.SetAuthCookie( name, rememberMe );
        }

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
            return Select( name, HashPassword( password ) ) != null;
        }

        public override void Delete( User entity )
        {
            base.Delete( entity );
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

        //public virtual void SetContextUserTo( User user )
        //{
        //    System.Threading.Thread.CurrentPrincipal = HttpContext.Current.User = user;
        //}

        #endregion

        private void ValidateDataRules( object entity )
        {
            var errors = DataAnnotationsValidationRunner.GetErrors( entity );
            if (errors.Any())
                throw new RulesException( errors );
        }

        private void ValidateBusinessRules( string name, string email, string password, string confirmpassword )
        {
            CheckPasswords( password, confirmpassword );
            CheckforDatabaseDuplicates( SelectList(), name, email );
        }

        private void ValidateBusinessRules( string password, string confirmpassword )
        {
            CheckPasswords( password, confirmpassword );
        }

        private void ValidateBusinessRules( User entity )
        {
            IQueryable<User> list;

            if (entity.UserId == 0)
                list = SelectList();
            else
                list = SelectList().Where( u => u.UserId != entity.UserId );

            CheckforDatabaseDuplicates( list, entity.Name, entity.Email );
        }

        private void CheckPasswords( string password, string confirmpassword )
        {
            if (string.IsNullOrEmpty( password ))
                throw new RulesException( "password", "You must enter a password", "user" );

            if (password.Length < 6)
                throw new RulesException( "password", "Password must be at least 6 characters", "user" );

            if (password != confirmpassword)
                throw new RulesException( "ConfirmPassword", "The passwords must be the same", "User" );
        }

        private void CheckforDatabaseDuplicates( IQueryable<User> list, string name, string email )
        {
            if (list.Any<User>( u => u.Name == name ))
                throw new RulesException( "Name", "Username already taken", "User" );
            
            if (email != "user@yahoo.com")
            {
                if (list.Any<User>( u => u.Email == email ))
                    throw new RulesException( "Email", "Email already taken", "User" );
            }

        }
    }
}
