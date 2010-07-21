using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service.Data;
using MvcContrib;
using Jumblist.Website.ViewModel;
using Jumblist.Website.Filter;
using xVal.ServerSide;
using StuartClode.Mvc.Extension;
using System.Text;
using Jumblist.Website.ModelBinder;
using System.Configuration;
using StuartClode.Mvc.Service.Serialization;

namespace Jumblist.Website.Controllers
{
    public class UsersController : ViewModelController<User>
    {
        private readonly string userKey = ConfigurationManager.AppSettings["UserModelBinderKey"]; 
        private IUserService userService;
        private IPostService postService;
        private IMailService mailService;
        private IDataService<UserAlert> userAlertService;

        public UsersController( IUserService userService, IPostService postService, IMailService mailService, IDataService<UserAlert> userAlertService )
        {
            this.userService = userService;
            this.postService = postService;
            this.mailService = mailService;
            this.userAlertService = userAlertService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        [CustomAuthorization( RoleLevelMinimum = RoleLevel.AnonymousUser )]
        public ViewResult Profile( [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            var item = userService.SelectRecord( user.Name );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Profile - {0}", item.Name );

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        [CustomAuthorization( RoleLevelMinimum = RoleLevel.AnonymousUser )]
        public ViewResult Edit( [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            var item = userService.SelectRecord( user.Name );

            var model = BuildDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );

            return View( model );
        }


        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateAntiForgeryToken]
        public ActionResult Save( User item )
        {
            User user = userService.SelectRecord( item.UserId );

            user.Name = item.Name;
            user.Email = item.Email;
            user.Postcode = item.Postcode.ToUpper();
            user.Radius = item.Radius;

            //UpdateModel( item, "Item", new[] { "Name", "Email", "Postcode", "Radius" } );

            try
            {
                userService.Save( user );
                userService.ResetAuthenticationCookie( user, true );

                Message = new Message { Text = user.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "profile" );
            }
            catch ( RulesException ex )
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDefaultViewModel().With( user );
            model.PageTitle = string.Format( "Edit - {0}", user.Name );
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View( "edit", model );
        }


        [AcceptVerbs( HttpVerbs.Get )]
        [CustomAuthorization( RoleLevelMinimum = RoleLevel.AnonymousUser )]
        public ViewResult Post( int id )
        {
            Post post = postService.SelectRecord( id );

            var model = DefaultView.CreateModel<Post>().With( post );

            model.PageTitle = string.Format( "Edit - {0}", post.Title );

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateAntiForgeryToken]
        public ActionResult Post( Post item )
        {
            Post post = postService.SelectRecord( item.PostId );
            //bool success = TryUpdateModel( post, "Item", new[] { "Url", "Title", "Body", "Display" }, collection.ToValueProvider() );

            post.Title = item.Title;
            post.Body = item.Body;
            post.Display = item.Display;

            string tags = Request.Form["Item.Tags"];
            if ( string.IsNullOrEmpty( tags ) ) tags = post.Title + ' ' + post.Body;

            try
            {
                 
                postService.Save( post );
                postService.DeletePostTags( post );
                postService.SavePostTags( post, tags );

                Message = new Message { Text = post.Title + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "profile" );
            }
            catch ( RulesException ex )
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = DefaultView.CreateModel<Post>().With( post );
            model.PageTitle = string.Format( "Edit - {0}", post.Title );
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        [CustomAuthorization( RoleLevelMinimum = RoleLevel.AnonymousUser )]
        public ViewResult Alert( int id )
        {
            UserAlert userAlert = userAlertService.SelectRecord( id );

            var model = DefaultView.CreateModel<UserAlert>().With( userAlert );

            model.PageTitle = string.Format( "Edit - {0}", userAlert.Name );
            model.PostListRouteValues = (PostListRouteValues)Serializer.Deserialize( userAlert.PostListRouteValues );
            model.UserSearchArea = (UserSearchArea)Serializer.Deserialize( userAlert.SearchArea );

            return View( model );
        }

        public ActionResult LoginLinks( [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            return PartialView( "LoginLinksControl", user );
        }

        //[AcceptVerbs( HttpVerbs.Get )]
        //public ViewResult LoginLinks_Alt(bool isAuthenticated, string name)
        //{
        //    if ( !isAuthenticated )
        //    {
        //        return View( "LoginLinksUnauthenticated" );
        //    }
        //    else
        //    {
        //        var item = userService.SelectRecord( name );
        //        var model = BuildDefaultViewModel().With( item );
        //        return View( "LoginLinksAuthenticated", model );
        //    }
        //}

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Login()
        {
            var model = BuildDefaultViewModel();
            model.PageTitle = "Login";
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateAntiForgeryToken]
        public ActionResult Login( string name, string password, bool rememberMe, string returnUrl, JumblistSession jumblistSession )
        {
            User user = userService.Authenticate( name, password );

            if ( user != null )
            {
                jumblistSession.UserSearchArea.Update( user.Postcode, user.Radius, user.Latitude, user.Longitude );
                return Redirect( returnUrl ?? "/" );
            }
            else
            {
                var model = BuildDefaultViewModel();
                model.PageTitle = "Login";
                model.Message = new Message { Text = "Unknown username or password", StyleClass = "error" };

                return View( model );
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult Logout()
        {
            userService.RemoveAuthenticationCookie();
            return this.RedirectToAction<HomeController>( c => c.Index( null ) );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Register()
        {
            var model = BuildDefaultViewModel();
            model.PageTitle = "Register";
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateAntiForgeryToken]
        public ActionResult Register( User item, string confirmPassword, string returnUrl, JumblistSession jumblistSession )
        {
            try
            {
                item.RoleId = Role.RegisteredUser.RoleId;
                User user = userService.Create( item, confirmPassword );

                if ( user != null )
                {
                    jumblistSession.UserSearchArea.Update( user.Postcode, user.Radius, user.Latitude, user.Longitude );
                    //userService.SetAuthenticationCookie( item, true );
                    mailService.SendRegistrationVerificationEmail( user );
                    Message = new Message { Text = "Thank you for registering. Please click on the link in the email to complete the process", StyleClass = "message" };

                }

                return Redirect( returnUrl ?? "/" );
            }
            catch ( RulesException ex )
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDefaultViewModel();
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectResult VerifyRegistration( string userId, string userEmail )
        {
            userId = userId.DecryptString();
            int id = Int32.Parse( userId );

            bool success = userService.VerifyRegistration( id, userEmail );

            if ( success )
            {
                Message = new Message { Text = "Thank you for registering", StyleClass = "message" };
            }
            else
            {
                Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            }

            return Redirect( "/" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult ForgottenPassword()
        {
            var model = BuildDefaultViewModel();
            model.PageTitle = "Forgotten Password";
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateAntiForgeryToken]
        public ActionResult ForgottenPassword( User item )
        {
            try
            {
                User user = userService.SelectRecord( x => x.Email == item.Email );

                mailService.SendForgottenPasswordEmail( user );
                Message = new Message { Text = "Your password will be reset. Please click on the link in the email to complete the process", StyleClass = "message" };

                return Redirect( "/" );
            }
            catch ( RulesException ex )
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            var model = BuildDefaultViewModel();
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectResult PasswordReset( string reset )
        {
            string userId = reset.DecryptString();
            int id = Int32.Parse( userId );

            User user = userService.SelectRecord( id );

            if ( user != null )
            {
                //need a random password string generatro here
                string password = userService.GenerateRandomPassword();
                user.Password = userService.HashPassword( password );
                userService.Save( user );
                mailService.SendPasswordResetEmail( user, password );

                Message = new Message { Text = "Please check your email for your new password", StyleClass = "message" };
            }
            else
            {
                Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            }

            return Redirect( "/" );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateAntiForgeryToken]
        public ActionResult SavePassword( int userId, string oldPassword, string newPassword, string confirmNewPassword )
        {
            //var user = userService.SelectRecord( userId );

            User user = userService.SelectRecord( userId );
            user = userService.Authenticate( user.Name, oldPassword );

            if ( user != null )
            {
                try
                {
                    userService.ResetPassword( user, newPassword, confirmNewPassword );
                    Message = new Message { Text = user.Name + " has changed their password.", StyleClass = "message" };
                    return RedirectToAction( "profile" );
                }
                catch ( RulesException ex )
                {
                    ex.AddModelStateErrors( ModelState, "Reset" );
                }
            }
            else
            {
                new RulesException( "OldPassword", "Old password is wrong" ).AddModelStateErrors( ModelState, "Reset" ); ;
            }

            var model = BuildDefaultViewModel().With( user );
            model.PageTitle = string.Format( "Edit - {0}", user.Name );
            model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
            return View( "edit", model );
        }
    }
}
