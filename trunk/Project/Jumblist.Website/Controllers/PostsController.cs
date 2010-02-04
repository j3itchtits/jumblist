using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Configuration;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using Jumblist.Core.Extension;
using Jumblist.Website.ViewModel;
using StuartClode.Mvc.Service;

namespace Jumblist.Website.Controllers
{
    public class PostsController : ViewModelController<Post>
    {
        private readonly IDataService<Post> postService;

        public PostsController( IDataService<Post> postService )
        {
            this.postService = postService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index()
        {
            return RedirectToAction( "list" );
        }

        public ViewResult List( int? id )
        {
            var list = postService.SelectList();
            var test = list.Alphabetical();
            var paged = new PaginatedList<Post>( list.ToList(), (id ?? 1), 3 );

            var model = BuildDefaultViewModel().With( paged );
            model.PageTitle = "All Posts";

            return View( model );
        }

        public ViewResult Detail( int id )
        {
            //var test = postService.GetFirstPost();

            var item = postService.Select( id );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Detail - {0}", item.Title );

            return View( model );
        }
    }
}
