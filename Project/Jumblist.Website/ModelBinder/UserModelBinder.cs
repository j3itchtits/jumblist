using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Service.Data;
using Jumblist.Core.Model;
using System.Configuration;
using System.Web.Security;
using System.Runtime.Serialization;
using System.Xml;
using System.IO;
using Microsoft.Practices.ServiceLocation;
using System.Text;

namespace Jumblist.Website.ModelBinder
{
    public class UserModelBinder : IModelBinder
    {
        private readonly string userKey = ConfigurationSettings.AppSettings["UserModelBinderKey"];

        //private readonly IUserService userService;

        //public UserModelBinder()
        //{
        //}

        //public UserModelBinder(IUserService userService)
        //{
        //    this.userService = userService;
        //}

        #region IModelBinder Members

        [ValidateInput( false )]
        public object BindModel( ControllerContext controllerContext, ModelBindingContext bindingContext )
        {
            if (bindingContext.Model != null)
                throw new InvalidOperationException("Cannot update instances");

            //HttpCookie userCookie = controllerContext.HttpContext.Request.Cookies[userKey];

            //// Attach the serialized user value from the userCookie to a User object
            //XmlReader reader = XmlReader.Create( new StringReader( userCookie.Value ) );
            //DataContractSerializer dcs = new DataContractSerializer( typeof( User ) );
            //User user = dcs.ReadObject( reader, true ) as User;


            // Get the authentication cookie
            string cookieName = FormsAuthentication.FormsCookieName;
            HttpCookie authCookie = controllerContext.HttpContext.Request.Cookies[cookieName];
            
            User user;
            
            if (authCookie != null)
            {
                // Get the authentication ticket
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt( authCookie.Value );

                // Attach the UserData from the  authTicket to a User object
                XmlReader reader = XmlReader.Create( new StringReader( authTicket.UserData ) );
                DataContractSerializer dcsRead = new DataContractSerializer( typeof( User ) );
                user = dcsRead.ReadObject( reader, true ) as User;
            }
            else
            {
                user = Jumblist.Core.Model.User.Anonymous;

                MemoryStream ms = new MemoryStream();
                DataContractSerializer dcsWrite = new DataContractSerializer( typeof( User ) );
                dcsWrite.WriteObject( ms, user );
                string userData = Encoding.UTF8.GetString( ms.ToArray() );

                var timeout = DateTime.Now.AddDays( 14 );

                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket( 1, user.Name, DateTime.Now, timeout, true, userData );
                string encTicket = FormsAuthentication.Encrypt( ticket );
                HttpCookie authenticationCookie = new HttpCookie( FormsAuthentication.FormsCookieName, encTicket );
                controllerContext.HttpContext.Response.Cookies.Add( authenticationCookie );
            }

            //HttpCookie MyCookie = new HttpCookie( userKey );
            //DateTime now = DateTime.Now;

            //MyCookie.Value = now.ToString();
            //MyCookie.Expires = now.AddHours( 1 );

            //Response.Cookies.Add( MyCookie );

            //User user = (controllerContext.HttpContext.User.Identity.IsAuthenticated) ? userService.SelectRecord(controllerContext.HttpContext.User.Identity.Name) : Jumblist.Core.Model.User.Anonymous;
            //User user = (controllerContext.HttpContext.User.Identity.IsAuthenticated) ? Jumblist.Core.Model.User.Administrator : Jumblist.Core.Model.User.Anonymous;

            //User user = (controllerContext.HttpContext.User.Identity.IsAuthenticated) ? (controllerContext.HttpContext.Session[userKey] as User) : null;

            //if (user == null)
            //{
            //    user = Jumblist.Core.Model.User.Anonymous;
            //    controllerContext.HttpContext.Session[userKey] = user;
            //}




            //User user;

            ////At this point we need a method on IUserService that allows us to GET the user details to either a anon session or auth cookie
            ////Perhaps we need 2 methods - one for anon and one for auth

            //var userService = ServiceLocator.Current.GetInstance<IUserService>();
            ////var user2 = userService.SelectRecord( user.Name );

            //// Get the authentication cookie
            //string cookieName = FormsAuthentication.FormsCookieName;
            //HttpCookie authCookie = controllerContext.HttpContext.Request.Cookies[cookieName];
            

            //// If the auth cookie can't be found then we need to access the anonymous user record stored in the session
            //if (authCookie == null)
            //{
            //    user = controllerContext.HttpContext.Session[userKey] as User;
            //}
            //else
            //{
            //    // Get the authentication ticket
            //    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt( authCookie.Value );

            //    // Attach the UserData from the  authTicket to a User object
            //    XmlReader reader = XmlReader.Create( new StringReader( authTicket.UserData ) );
            //    DataContractSerializer dcs = new DataContractSerializer(typeof(User));
            //    user = dcs.ReadObject(reader, true) as User;
            //}



            return user;
        }

        #endregion
    }
}
