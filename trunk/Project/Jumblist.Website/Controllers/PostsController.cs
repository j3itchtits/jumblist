using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Model.Interface;
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
        // GET: /Posts/List/[parameter1]

        public ViewResult List( int? parameter1 )
        {
            var postList = postRespository.Posts;

            var pagedPostList = new PaginatedList<Post>( postList, ( parameter1 ?? 1 ), PageSize );

            return View( "List", pagedPostList );

        }

        //
        // GET: /Posts/List/[parameter1]

        //public ViewResult List( string parameter1, int? parameter2 )
        //{
        //    var postList = ( string.IsNullOrEmpty( parameter1 ) )
        //        ? postRespository.Posts
        //        : postRespository.Posts.Where( p => p.Category.Name == parameter1 );

        //    ViewData["Category"] = parameter1;

        //    var pagedPostList = new PaginatedList<Post>( postList, ( parameter2 ?? 1 ), PageSize );

        //    return View( "List", pagedPostList );

        //}


        //
        // GET: /Posts/Tagged/[parameter1]/[parameter2]

        public ViewResult Tagged( string parameter1, int? parameter2 )
        {
            var postList = postRespository.SelectPostsByTag( parameter1 );

            var pagedPostList = new PaginatedList<Post>( postList, (parameter2 ?? 1), PageSize );

            return View( pagedPostList );
        }


        //
        // GET: /Posts/Location/[parameter1]/[parameter2]

        public ViewResult Location( string parameter1, int? parameter2 )
        {
            var postList = postRespository.SelectPostsByLocation( parameter1 );

            var pagedPostList = new PaginatedList<Post>( postList, (parameter2 ?? 1), PageSize );

            return View( pagedPostList );
        }


        // HTTP-GET: /Post/[id]/[name]

        public ViewResult Details( int? id, string name )
        {
            ViewData["PageTitle"] = "Details";
            var model = postRespository.SelectPost( (id ?? 1) );

            if (model == null)
                return View( "NotFound" );
            else
                return View( "Details", model );
        }



    }
}
