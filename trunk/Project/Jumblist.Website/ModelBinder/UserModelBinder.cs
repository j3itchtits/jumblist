using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Service;
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
        private readonly string userKey = ConfigurationManager.AppSettings["UserModelBinderKey"];

        #region IModelBinder Members

        [ValidateInput( false )]
        public object BindModel( ControllerContext controllerContext, ModelBindingContext bindingContext )
        {
            if ( controllerContext == null )
            {
                throw new ArgumentNullException( "controllerContext" );
            }

            if ( bindingContext == null )
            {
                throw new ArgumentNullException( "bindingContext" );
            }

            if ( bindingContext.Model != null )
            {
                //return bindingContext.Model as User;
                throw new InvalidOperationException( "Cannot update instances" );
            }

            //HttpCookie userCookie = controllerContext.HttpContext.Request.Cookies[userKey];

            //// Attach the serialized user value from the userCookie to a User object
            //XmlReader reader = XmlReader.Create( new StringReader( userCookie.Value ) );
            //DataContractSerializer dcs = new DataContractSerializer( typeof( User ) );
            //User user = dcs.ReadObject( reader, true ) as User;


            //var userService = ServiceLocator.Current.GetInstance<IUserService>();

            // Get the authentication cookie
            HttpCookie authCookie = controllerContext.HttpContext.Request.Cookies[FormsAuthentication.FormsCookieName];
            User user;

            if (authCookie != null)
            {
                user = DeserializeAuthenticationCookie( authCookie.Value );
            }
            else
            {
                user = controllerContext.HttpContext.Session[userKey] as User;
            }

            return user;


            //Don't really need this as the Session[userKey] is set in global.asax
            //if (user.Search == null)
            //{
            //    user.Search = new SearchUser( string.Empty, 0, 0, 0 );
            //    controllerContext.HttpContext.Session[userSearchKey] = user.Search;
            //}




            //if (authCookie != null)
            //{
            //    user = userService.DeserializeAuthenticationCookie(authCookie.Value);
            //    user.Search = controllerContext.HttpContext.Session["_search"] as SearchUser;
            //}
            //else
            //{
            //    //user = Jumblist.Core.Model.User.Anonymous;
            //    //DateTime timeout = DateTime.Now.AddDays( 14 );
            //    //HttpCookie authenticationCookie = userService.CreateAuthenticationCookie(user, timeout);
            //    //controllerContext.HttpContext.Response.Cookies.Add( authenticationCookie );

            //    //create a new SearchUser with all blank properties and add it to a session variable
            //    //var searchUser = new SearchUser();
            //    user = Jumblist.Core.Model.User.Anonymous;
            //    controllerContext.HttpContext.Session["_search"] = new SearchUser();

            //    //HttpCookie testCookie = new HttpCookie("test");
            //    //testCookie.Value = "Hello";
            //    //testCookie.Expires = DateTime.Now.AddHours(1);
            //    //controllerContext.HttpContext.Response.Cookies.Add(testCookie);
            //}

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



            
        }

        #endregion

        private User DeserializeAuthenticationCookie( string cookieValue )
        {
            // Get the authentication ticket
            FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt( cookieValue );

            // Attach the UserData from the  authTicket to a User object
            XmlReader reader = XmlReader.Create( new StringReader( authTicket.UserData ) );
            DataContractSerializer dcsRead = new DataContractSerializer( typeof( User ) );
            User user = dcsRead.ReadObject( reader, true ) as User;

            return user;
        }
    }
}
