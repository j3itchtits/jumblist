using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Model.Abstract;
using Jumblist.Model.Repository;
using System.Configuration;

namespace Jumblist.Website.Controllers
{
    public class PostsController : Controller
    {

        private IPostRepository postRespository;

        public PostsController( IPostRepository postRespository )
        {
            this.postRespository = postRespository;
        }

        public int PageSize { get; set; }

        //
        // GET: /Posts/

        public ViewResult List( int? id )
        {
            PageSize = 3;
            if (id == null) id = 1;

            var postList = postRespository.SelectPosts();
            int totalNumberOfPosts = postList.Count();

            ViewData["TotalPages"] = totalNumberOfPosts / PageSize;
            ViewData["CurrentPage"] = id;

            return View( postList.Skip( ( (int)id - 1 ) * PageSize ).Take( PageSize ).ToList() );
        }

        //
        // GET: /Posts/Tag/[tagName]

        public ViewResult Tag( string tagName )
        {
            return View(postRespository.SelectPostsByTag(tagName).ToList());
        }

        // HTTP-GET: /Posts/Details/[id]

        public ViewResult Details( int id )
        {
            ViewData["PageTitle"] = "Details";
            var model = postRespository.SelectPost( id );

            if (model == null)
                return View( "NotFound" );
            else
                return View( "Details", model );
        }

        // HTTP-GET: /Posts/Details/[name]

        public ViewResult Item( string name )
        {
            var model = postRespository.SelectPost( name );

            if (model == null)
                return View( "NotFound" );
            else
                return View("Item", model);
        }
    }
}
