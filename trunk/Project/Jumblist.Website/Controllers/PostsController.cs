using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Model.Abstract;
using Jumblist.Model.Repository;
using System.Configuration;
using Jumblist.Model.Entity;
using Jumblist.Website.Helpers;

namespace Jumblist.Website.Controllers
{
    public class PostsController : Controller
    {
        private int pageSize = 3;
        private IPostRepository postRespository;

        public PostsController( IPostRepository postRespository )
        {
            this.postRespository = postRespository;
        }

        public int PageSize 
        {
            get { return pageSize; }
            set { pageSize = value; } 
        }

        //
        // GET: /Posts/

        public ViewResult List( int? id )
        {
            if (id == null) id = 1;

            var postList = postRespository.SelectPosts();

            var pagedPostList = new PaginatedList<Post>(postList, (id ?? 0), PageSize);

            return View(pagedPostList);



            //int totalNumberOfPosts = postList.Count();

            //ViewData["TotalPages"] = (int)Math.Ceiling(totalNumberOfPosts / (double)PageSize);
            //ViewData["CurrentPage"] = id;

            //return View( postList.Skip( ( (int)id - 1 ) * PageSize ).Take( PageSize ).ToList() );
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
