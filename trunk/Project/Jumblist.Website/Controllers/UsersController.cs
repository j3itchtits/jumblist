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
        public ViewResult Profile( User user )
        {
            var item = userService.SelectRecord( user.Name );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Profile - {0}", item.Name );

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        [CustomAuthorization( RoleLevelMinimum = RoleLevel.AnonymousUser )]
        public ViewResult Edit( User user )
        {
            var item = userService.SelectRecord( user.Name );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        //[ValidateInput( false )]
        //[ValidateAntiForgeryToken]
        public ActionResult Save( [ModelBinder( typeof( DefaultModelBinder ) )] int id, FormCollection form )
        {
            User user = userService.SelectRecord( id );
            //int radius = Int32.Parse( form["Item.Radius"] );
            //user.Radius = radius;
            //bool success = TryUpdateModel( user, "Item", new[] { "Name", "Email", "Postcode", "Radius" }, form.ToValueProvider() );
            UpdateModel( user, "Item", form.ToValueProvider() );




            try
            {
                //item.Password = "1B4E9835735B0FB2EF62623D0E392EC40E0C339F";
                //item.IsActive = true;
                //item.DateCreated = DateTime.Now;
                //item.RoleId = 2;

                

                //userService.Update( item );

                userService.Save2( user );
            }
            catch ( RulesException ex )
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            if ( ModelState.IsValid )
            {
                Message = new Message { Text = user.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "profile" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( user );
                model.PageTitle = string.Format( "Edit - {0}", user.Name );

                var errorMessage = new StringBuilder();

                foreach ( var modelStateValue in ModelState.Values )
                {
                    foreach ( var error in modelStateValue.Errors )
                    {
                        // Do something useful with these properties
                        errorMessage.Append( error.ErrorMessage );
                        //var exception = error.Exception;
                    }
                }

                model.Message = new Message { Text = "Something went wrong - " + errorMessage.ToString(), StyleClass = "error" };
                return View( "edit", model );
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Post( int id )
        {
            Post post = postService.SelectRecord( id );

            var model = DefaultView.CreateModel<Post>().With( post );

            model.PageTitle = string.Format( "Edit - {0}", post.Title );

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Post( int id, FormCollection collection )
        {
            Post post = postService.SelectRecord( id );
            UpdateModel( post, "Item", new[] { "Title" }, collection.ToValueProvider() );

            if ( ModelState.IsValid )
            {
                try
                {
                    postService.Update( post );
                    Message = new Message { Text = post.Title + " has been saved.", StyleClass = "message" };
                    return RedirectToAction( "profile" );
                }
                catch ( RulesException ex )
                {
                    ex.AddModelStateErrors( ModelState, "Item" );

                    var model = DefaultView.CreateModel<Post>().With( post );
                    model.PageTitle = string.Format( "Edit - {0}", post.Title );

                    //var errorMessage = new StringBuilder();

                    //foreach ( var modelStateValue in ModelState.Values )
                    //{
                    //    foreach ( var error in modelStateValue.Errors )
                    //    {
                    //        // Do something useful with these properties
                    //        errorMessage.Append( error.ErrorMessage );
                    //        //var exception = error.Exception;
                    //    }
                    //}

                    //model.Message = new Message { Text = "Something went wrong - " + errorMessage.ToString(), StyleClass = "error" };

                    model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                    return View( "edit", model );
                }
            }

            PageTitle = "Sorry we have a problem";
            Message = new Message { Text = "The modelstate is invalid", StyleClass = "message" };
            return RedirectToAction( "problem" );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult LoginLinks( User user )
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
            User user = userService.Authenticate( name, password );

            if (user != null)
            {
                userService.SetAuthenticationCookie( user, rememberMe );

                if ( !string.IsNullOrEmpty( returnUrl ) )
                    return Redirect( returnUrl );
                else
                    return this.RedirectToAction<HomeController>( c => c.Index( user ) );
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
        public ActionResult Register( [ModelBinder( typeof( DefaultModelBinder ) )] User item, string confirmPassword, string returnUrl )
        {
            try
            {
                item.RoleId = Role.RegisteredUser.RoleId;
                userService.Create( item, confirmPassword );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            if (ModelState.IsValid)
            {
                userService.SetAuthenticationCookie( item, true );
                Message = new Message { Text = "Thank you for registering", StyleClass = "message" };

                if (!string.IsNullOrEmpty( returnUrl ))
                    return Redirect( returnUrl );
                else
                    return this.RedirectToAction<HomeController>( c => c.Index( item ) );
            }
            else
            {
                var model = BuildDefaultViewModel();
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                return View( model );
            }
        }
    }
}
