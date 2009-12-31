using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Configuration;
using JumblistTest.Core.Model;
using JumblistTest.Core.Service;
using JumblistTest.Website.ViewModel;
using StuartClode.Mvc.Service;

namespace JumblistTest.Website.Controller
{
    public class PostsController : ViewModelController<Post>
    {
        private readonly IDataService<Post> postService;

        public PostsController( IDataService<Post> postService )
        {
            this.postService = postService;
        }

        public ViewResult List()
        {
            var list = postService.SelectList();
            var test = list.Alphabetical();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Posts";

            return View( model );
        }

        public ViewResult Detail( int? id )
        {
            //var test = postService.GetFirstPost();

            var item = postService.Select( (id ?? 1) );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Detail - {0}", item.Title );

            if (model == null)
                return View( "NotFound" );
            else
                return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Post() );
            model.PageTitle = "Create";

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int? id )
        {
            var item = postService.Select( (id ?? 1) );

            //var authorList = authorService.SelectList();
            //var model = new PostEditViewModel( item, authorList );
            //var model = PostView.Data.WithPost( item );

            var model = BuildDataEditDefaultViewModel().With( item );
            //var model = DefaultView.Model<Post>().With( item );

            model.PageTitle = string.Format( "Edit - {0}", item.Title );

            if (model == null)
                return View( "NotFound" );
            else
                return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Save( Post post )
        {
            if (ModelState.IsValid)
            {
                postService.Save( post );
                TempData["notificationmessage"] = post.Title + " has been saved.";
                return RedirectToAction( "list" );
            }
            else
            {
                return View( "Edit", post );
            }
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var post = postService.Select( id );
            postService.Delete( post );
            TempData["notificationmessage"] = post.Title + " has been deleted";

            var model = postService.SelectList();
            return PartialView( "ListPosts", model );
        }
    }
}
