using System.Collections.Generic;
using System.Linq;
using System.Web;
using System;
using xVal.ServerSide;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Validation;
using StuartClode.Mvc.Service.Map;
using System.Linq.Expressions;
using System.Security.Principal;
using System.Web.Security;
using System.Xml.Serialization;
using System.IO;
using System.Text;
using System.Runtime.Serialization;
using System.Xml;
using System.Configuration;
using System.Net.Mail;
using StuartClode.Mvc.Service.Randomize;
using Castle.Components.Common.TemplateEngine.NVelocityTemplateEngine;
using Castle.Components.Common.TemplateEngine;
using System.ComponentModel;
using System.Collections;

namespace Jumblist.Core.Service
{
    public class UserService : DataService<User>, IUserService
    {
        private readonly int defaultLocationRadius = int.Parse( ConfigurationManager.AppSettings["DefaultLocationRadius"] );
        private readonly string userKey = ConfigurationManager.AppSettings["UserModelBinderKey"]; 
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
            Save( user, false );
        }

        public override void Save( User user, bool isDetachedFromDatabase )
        {
            var bingLocationService = new BingLocationService( user.Postcode );

            user.Latitude = bingLocationService.Latitude;
            user.Longitude = bingLocationService.Longitude;

            ValidateDataRules( user );
            ValidateBusinessRules( user );

            base.Save( user, isDetachedFromDatabase );
        }

        public override void Delete( User user )
        {
            base.Delete( user );
        }

        public User Create( User user, string confirmPassword )
        {
            var bingLocationService = new BingLocationService( user.Postcode.ToUpper() );

            string password = user.Password;

            user.Radius = defaultLocationRadius;
            user.Postcode = user.Postcode.ToUpper();
            user.Latitude = bingLocationService.Latitude;
            user.Longitude = bingLocationService.Longitude;
            user.Password = HashPassword( password );
            user.IsActive = false;
            user.DateCreated = DateTime.Now;

            ValidateDataRules( user );
            ValidateBusinessRules( user.Name, user.Email, password, confirmPassword );

            base.Save( user );

            return user;
        }

        public void SetAuthenticationCookie( User user, bool rememberMe )
        {
            //Create a cookie to persist the authenticated user across requests
            user.IsAuthenticated = true;

            //1. using datacontract serialization
            var timeout = (rememberMe) ? DateTime.Now.AddDays(14) : DateTime.Now.AddMinutes(30);
            HttpCookie authenticationCookie = CreateAuthenticationCookie( user, timeout );
            HttpContext.Current.Response.Cookies.Add( authenticationCookie );
        }

        public void RemoveAuthenticationCookie()
        {
            formsAuth.SignOut();
            HttpContext.Current.Session[userKey] = Jumblist.Core.Model.User.Anonymous;
        }

        public void ResetAuthenticationCookie( User user, bool rememberMe )
        {
            RemoveAuthenticationCookie();
            SetAuthenticationCookie( user, true );
        }

        public string HashPassword( string password )
        {
            return formsAuth.HashPasswordForStoringInConfigFile( password );
        }

        public void ResetPassword( User user, string password, string confirmPassword )
        {
            ValidateBusinessRules( password, confirmPassword );
            user.Password = HashPassword( password );

            base.Save( user );
        }

        public string GenerateRandomPassword()
        {
            IPassword target = new Password();
            int length = 10;

            target.MinLowerCaseChars = 2;
            target.MinUpperCaseChars = 1;
            target.MinNumericChars = 3;
            target.MinSpecialChars = 1;
            target.FillRest = CharType.LowerCase;

            return target.GeneratePassword( length );
        }

        public User Authenticate( string name, string password )
        {
            User user = SelectRecord( User.WhereNamePasswordEquals( name, HashPassword( password ) ) );

            if ( user == null )
            {
                user = SelectRecord( User.WhereEmailPasswordEquals( name, HashPassword( password ) ) );
            }

            if ( user != null )
            {
                SetAuthenticationCookie( user, true );
            }

            return user;
        }

        public bool VerifyRegistration( int id, string email )
        {
            User user = SelectRecord( User.CheckForUnverifiedUser( id, email ) );

            if ( user != null )
            {
                user.IsActive = true;
                user.DateVerified = DateTime.Now;
                base.Save( user );
                SetAuthenticationCookie( user, true );
            }

            return user != null;
        }


        #endregion


        private HttpCookie CreateAuthenticationCookie( User user, DateTime timeout )
        {
            MemoryStream ms = new MemoryStream();
            DataContractSerializer dcsWrite = new DataContractSerializer( typeof( User ) );
            dcsWrite.WriteObject( ms, user );
            string userData = Encoding.UTF8.GetString( ms.ToArray() );

            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket( 1, user.Name, DateTime.Now, timeout, true, userData );
            string encTicket = FormsAuthentication.Encrypt( ticket );
            HttpCookie authenticationCookie = new HttpCookie( FormsAuthentication.FormsCookieName, encTicket );
            authenticationCookie.Expires = timeout;

            return authenticationCookie;
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

        //public virtual User CurrentUser
        //{
        //    get
        //    {
        //        var user = HttpContext.Current.User as User;
        //        if (user == null) throw new ApplicationException( "HttpContext.User is not a Jumblist.Website.Model.User" );
        //        return user;
        //    }
        //}

        //public virtual void SetAuthenticationCookie_Alt( User user, bool rememberMe )
        //{
        //    //Just a quick test to see if i can pass the user to controllers via the model binder
        //    formsAuth.SetAuthCookie( user.Name, rememberMe );
        //    HttpContext.Current.Session[userKey] = user;
        //}

        //public virtual HttpCookie UpdateAuthenticationCookie( HttpCookie authenticationCookie, User user )
        //{
        //    MemoryStream ms = new MemoryStream();
        //    DataContractSerializer dcsWrite = new DataContractSerializer(typeof(User));
        //    dcsWrite.WriteObject(ms, user);
        //    string userData = Encoding.UTF8.GetString(ms.ToArray());

        //    DateTime timeout = DateTime.Now.AddDays(1);

        //    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, user.Name, DateTime.Now, timeout, true, userData);
        //    string encTicket = FormsAuthentication.Encrypt(ticket);
        //    authenticationCookie.Value = encTicket;

        //    return authenticationCookie;
        //}

        //public virtual HttpCookie FetchAuthenticationCookie()
        //{
        //    string cookieName = FormsAuthentication.FormsCookieName;
        //    HttpCookie authCookie = HttpContext.Current.Request.Cookies[cookieName];
        //    return authCookie;
        //}

        //public virtual User DeserializeAuthenticationCookie( string cookieValue )
        //{
        //    // Get the authentication ticket
        //    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(cookieValue);

        //    // Attach the UserData from the  authTicket to a User object
        //    XmlReader reader = XmlReader.Create(new StringReader(authTicket.UserData));
        //    DataContractSerializer dcsRead = new DataContractSerializer(typeof(User));
        //    User user = dcsRead.ReadObject(reader, true) as User;

        //    return user;
        //}

        //DISCARDED SERIALIZATION OPTIONS

        //HttpCookie userCookie = new HttpCookie( userKey );
        //userCookie.Value = userData;
        //userCookie.Expires = DateTime.Now.AddDays( 14 );
        //HttpContext.Current.Response.Cookies.Add( userCookie );



        //StringBuilder sb = new StringBuilder();
        //XmlWriter writer = XmlWriter.Create( sb );
        //dcs.WriteObject( writer, user );
        //writer.Close();
        //var userData = sb.ToString();

        //2. using xml serialization

        //TextWriter outStream = new StringWriter();
        //XmlSerializer s = new XmlSerializer( typeof( User ) );
        //s.Serialize( outStream, user );
        //string xmlResult = outStream.ToString();
        //var userData1 = xmlResult;

        //XmlSerializer s1 = new XmlSerializer( typeof( User ) );
        //User user2 = (User)s.Deserialize( new StringReader( userData1 ) );


        //SerializableEntity<User> entity = new SerializableEntity<User>(user);
        //TextWriter tw = new StringWriter();
        //XmlSerializer serializer = new XmlSerializer(entity.GetType());
        //serializer.Serialize(tw, entity);
        //string xmlResult2 = tw.ToString();
        //var userData = xmlResult2;
    }
}
