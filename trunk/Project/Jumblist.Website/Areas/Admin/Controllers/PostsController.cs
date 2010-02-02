using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Website.Filter;
using Jumblist.Core.Service.Data;
using xVal.ServerSide;
using StuartClode.Mvc.Service;
using Jumblist.Website.ViewModel;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class PostsController : ViewModelController<Post>
    {
        private IPostService postService;
        private IDataService<PostCategory> postCategoryService;
        private IDataService<Feed> feedService;

        public PostsController( IPostService postService, IDataService<PostCategory> postCategoryService, IDataService<Feed> feedService )
        {
            this.postService = postService;
            this.postCategoryService = postCategoryService;
            this.feedService = feedService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = postService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Posts";

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Post() { DateTime = DateTime.Now } );
            model.PageTitle = "Create a new post";
            model.Message = new Message { Text = "You are about to create a post", StyleClass = "message" };

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = postService.Select( id );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Title );
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateInput( false )]
        public ActionResult Save( Post item )
        {
            try
            {
                postService.Save( item );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            if (ModelState.IsValid)
            {
                Message = new Message { Text = item.Title + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( item );
                model.PageTitle = string.Format( "Edit - {0}", item.Title );
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                return View( "edit", model );
            }
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var feed = postService.Select( id );
            postService.Delete( feed );

            var model = postService.SelectList();

            return PartialView("ListPartial", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryList()
        {
            var list = postCategoryService.SelectList();

            var model = DefaultView.Model<PostCategory>().With(list);
            model.PageTitle = "Post Categories";

            return View("CategoryList", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryEdit(int id)
        {
            var item = postCategoryService.Select(id);

            var model = DefaultView.Model<PostCategory>().With(item);
            model.PageTitle = string.Format("Edit - {0}", item.Name);
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View(model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult CategoryCreate()
        {
            var model = DefaultView.Model<PostCategory>().With(new PostCategory());
            model.PageTitle = "Create a new category";
            model.Message = new Message { Text = "You are about to create a category", StyleClass = "message" };

            return View("CategoryEdit", model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CategorySave(PostCategory item)
        {
            try
            {
                postCategoryService.Save(item);
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors(ModelState, "Item");
            }

            if (ModelState.IsValid)
            {
                Message = new Message { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction("categorylist");
            }
            else
            {
                var model = DefaultView.Model<PostCategory>().With(item);
                model.PageTitle = string.Format("Edit - {0}", item.Name);
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                return View("categoryedit", model);
            }
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult ListByCategory( int id )
        {
            var item = postCategoryService.Select( id );
            var list = postService.SelectList().Where( x => x.PostCategoryId == id );

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Posts by Category - " + item.Name;

            return View( "list", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult ListByFeed( int id )
        {
            var item = feedService.Select( id );
            var list = postService.SelectList().Where( x => x.FeedId == id );

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Posts by Feed - " + item.Title;

            return View( "list", model );
        }
    }
}
