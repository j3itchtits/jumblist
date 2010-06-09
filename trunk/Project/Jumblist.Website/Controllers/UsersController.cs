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

namespace Jumblist.Website.Controllers
{
    public class UsersController : ViewModelController<User>
    {
        private IUserService userService;
        private IPostService postService;

        public UsersController( IUserService userService, IPostService postService )
        {
            this.userService = userService;
            this.postService = postService;
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
            user.Postcode = item.Postcode;
            user.Radius = item.Radius;

            //UpdateModel( item, "Item", new[] { "Name", "Email", "Postcode", "Radius" } );

            try
            {
                userService.Save( user );
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

            post.Url = item.Url;
            post.Title = item.Title;
            post.Body = item.Body;
            post.Display = item.Display;

            try
            {
                postService.Save( post );
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

        [AcceptVerbs(HttpVerbs.Get)]
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
            model.PageTitle = "Log on";
            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Login( string name, string password, bool rememberMe, string returnUrl )
        {
            bool success = userService.Authenticate( name, password );

            if ( success )
            {
                return Redirect( returnUrl ?? "/" );

                //if ( !string.IsNullOrEmpty( returnUrl ) )
                //    return Redirect( returnUrl );
                //else
                //    return this.RedirectToAction<HomeController>( c => c.Index( user ) );
            }
            else
            {
                var model = BuildDefaultViewModel();
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
        public ActionResult Register( User item, string confirmPassword, string returnUrl )
        {
            try
            {
                item.RoleId = Role.RegisteredUser.RoleId;
                User user = userService.Create( item, confirmPassword );

                //userService.SetAuthenticationCookie( item, true );
                userService.SendVerificationEmail( user );
                Message = new Message { Text = "Thank you for registering. Please click on the link in the email to complete the process", StyleClass = "message" };

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
        public RedirectResult Verify( string userId, string userEmail )
        {
            userId = userId.DecryptString();
            int id = Int32.Parse( userId );

            bool success = userService.Verify( id, userEmail );

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
    }
}
