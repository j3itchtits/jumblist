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
using Jumblist.Core.Service.Data;

namespace Jumblist.Website.Controllers
{
    public class PostsController : ViewModelController<Post>
    {
        private readonly IPostService postService;
        private readonly IDataService<Location> locationService;
        private readonly IDataService<Tag> tagService;

        public PostsController(IPostService postService, IDataService<Location> locationService, IDataService<Tag> tagService)
        {
            this.postService = postService;
            this.locationService = locationService;
            this.tagService = tagService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult List( int? page )
        {
            var list = postService.SelectList();
            var test = list.Alphabetical();
            var paged = new PaginatedList<Post>( list.ToList(), (page ?? 1), 3 );

            var model = BuildDefaultViewModel().With( paged );
            model.PageTitle = "All Posts";

            ViewData["Action"] = "list";
            ViewData["Id"] = "";

            return View( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Detail( int id )
        {
            var item = postService.Select( id );
            var model = BuildDefaultViewModel().With( item );

            model.PageTitle = string.Format( "Detail - {0}", item.Title );

            return View( model );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Location(string id, int? page)
        {
            var item = locationService.SelectList().Single(x => x.FriendlyUrl == id);
            var list = postService.SelectPostsByLocation(id);
            var paged = new PaginatedList<Post>(list.ToList(), (page ?? 1), 3);

            var model = BuildDefaultViewModel().With(paged);
            model.PageTitle = "All Posts by Location - " + item.Name;

            ViewData["Action"] = "location";
            ViewData["Id"] = id;

            return View("list", model);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Tagged(string id, int? page)
        {
            var item = tagService.SelectList().Single(x => x.FriendlyUrl == id);
            var list = postService.SelectPostsByTag(id);
            var paged = new PaginatedList<Post>(list.ToList(), (page ?? 1), 3);

            var model = BuildDefaultViewModel().With(paged);
            model.PageTitle = "All Posts by Tag - " + item.Name;

            ViewData["Action"] = "tagged";
            ViewData["Id"] = id;

            return View("list", model);
        }
    }
}
