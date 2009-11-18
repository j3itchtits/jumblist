using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Data.Access;
using System.Configuration;
using Jumblist.Data.Model;
using Jumblist.Website.Helpers;
using Jumblist.Website.Services.Navigation;
using Jumblist.Website.Services.Paging;

namespace Jumblist.Website.Controllers
{
    public class PostsController : Controller
    {
        private int pageSize = 5;
        private IPostRepository postRespository;
        private IPostCategoryRepository postCategoryRespository;

        public PostsController( IPostRepository postRespository, IPostCategoryRepository postCategoryRespository )
        {
            this.postRespository = postRespository;
            this.postCategoryRespository = postCategoryRespository;
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

            var pagedPostList = new PaginatedList<Post>( postList.ToList(), ( parameter1 ?? 1 ), PageSize );

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
        // GET: /Posts/Categories

        public ViewResult Categories( string highlightedCategory )
        {
            var postCategoryList = postCategoryRespository.PostCategories;
            //var categories = postRespository.Posts.Select( x => x.Category ).Distinct();

            List<Link> navLinks = new List<Link>();
            navLinks.Add( new CategoryLink( null ) { IsSelected = ( string.IsNullOrEmpty( highlightedCategory ) ) } );
            foreach ( var category in postCategoryList )
            {
                navLinks.Add( new CategoryLink( category.Name ) { IsSelected = ( highlightedCategory == category.Name ) } );
            }

            return View( "Categories", navLinks );
        }

        //
        // GET: /Posts/Category/[parameter1=category]/[parameter2=pagenumber]

        public ViewResult Category( string parameter1, int? parameter2 )
        {
            this.PageSize = 2;

            var postCategory = postCategoryRespository.SelectPostCategory( parameter1 );

            ViewData["CategoryName"] = postCategory.Name;
            var pagedPostList = new PaginatedList<Post>( postCategory.Posts, (parameter2 ?? 1), PageSize );

            //this needs to be a view model as we don't really want to have to use viewdata

            return View( "Category", pagedPostList );
        }


        //
        // GET: /Posts/Tagged/[parameter1]/[parameter2]

        public ViewResult Tagged( string parameter1, int? parameter2 )
        {
            var postList = postRespository.SelectPostsByTag( parameter1 );

            var pagedPostList = new PaginatedList<Post>( postList.ToList(), (parameter2 ?? 1), PageSize );

            return View( pagedPostList );
        }


        //
        // GET: /Posts/Location/[parameter1]/[parameter2]

        public ViewResult Location( string parameter1, int? parameter2 )
        {
            var postList = postRespository.SelectPostsByLocation( parameter1 );

            var pagedPostList = new PaginatedList<Post>( postList.ToList(), ( parameter2 ?? 1 ), PageSize );

            return View( pagedPostList );
        }


        //
        // GET: /Posts/Author/[parameter1]/[parameter2]

        public ViewResult Author( string parameter1, int? parameter2 )
        {
            this.PageSize = 1;

            var postList = postRespository.SelectPostsByAuthor( parameter1 );

            var pagedPostList = new PaginatedList<Post>( postList.ToList(), ( parameter2 ?? 1 ), PageSize );

            return View( pagedPostList );
        }


        //
        // GET: /Posts/Feed/[parameter1]/[parameter2]

        public ViewResult Feed( string parameter1, int? parameter2 )
        {
            var postList = postRespository.SelectPostsByFeed( parameter1 );

            var pagedPostList = new PaginatedList<Post>( postList.ToList(), ( parameter2 ?? 1 ), PageSize );

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
