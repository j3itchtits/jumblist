﻿using System.Collections.Generic;
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
using System.Linq.Expressions;

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

        public override IQueryable<User> SelectRecordList()
        {
            return base.SelectRecordList();
        }

        public override IQueryable<User> SelectRecordList( Expression<Func<User, bool>> whereCondition )
        {
            return base.SelectRecordList( whereCondition );
        }

        public override User SelectRecord( int id )
        {
            return base.SelectRecord( id );
        }

        public override User SelectRecord( Expression<Func<User, bool>> whereCondition )
        {
            return base.SelectRecord( whereCondition );
        }

        public User SelectRecord( string name )
        {
            return SelectRecord( User.WhereNameEquals( name ) );
        }

        public override void Save( User user )
        {
            var bingLocationService = new BingLocationService( user.Postcode );

            user.Latitude = bingLocationService.Latitude;
            user.Longitude = bingLocationService.Longitude;

            ValidateDataRules( user );
            ValidateBusinessRules( user );

            base.Save( user );
        }

        public override void Update( User user )
        {
            base.Update( user );
        }

        public void ResetPassword( User user, string password, string confirmPassword )
        {
            ValidateBusinessRules( password, confirmPassword );
            user.Password = HashPassword( password );

            base.Update( user );
        }

        public void Create( User user, string confirmPassword )
        {
            var bingLocationService = new BingLocationService( user.Postcode.ToUpper() );

            string password = user.Password;

            user.SearchRadiusMiles = 5;
            user.Postcode = user.Postcode.ToUpper();
            user.Latitude = bingLocationService.Latitude;
            user.Longitude = bingLocationService.Longitude;
            user.Password = HashPassword( password );
            user.IsActive = true;
            user.DateCreated = DateTime.Now;

            ValidateDataRules( user );
            ValidateBusinessRules( user.Name, user.Email, password, confirmPassword );

            base.Save( user );
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
            return SelectRecord( u => ( u.Name == name && u.Password == HashPassword( password ) && u.IsActive ) ) != null;
        }

        public override void Delete( User user )
        {
            base.Delete( user );
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
            CheckforDatabaseDuplicates( SelectRecordList(), name, email );
        }

        private void ValidateBusinessRules( string password, string confirmpassword )
        {
            CheckPasswords( password, confirmpassword );
        }

        private void ValidateBusinessRules( User user )
        {
            var list = base.IsNew( user ) ? SelectRecordList() : SelectRecordList( User.WhereNotEquals( user ) );

            CheckforDatabaseDuplicates( list, user.Name, user.Email );
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
            if ( base.IsDuplicate( list, User.WhereNameEquals( name ) ) )
                throw new RulesException( "Name", "Username already taken", "User" );
            
            if (email != "user@yahoo.com")
            {
                if ( base.IsDuplicate( list, User.WhereEmailEquals( email ) ) )
                    throw new RulesException( "Email", "Email already taken", "User" );
            }

        }
    }
}
