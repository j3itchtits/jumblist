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

        //
        // GET: /Posts/

        public ActionResult Index()
        {
            return View(postRespository.SelectPosts().ToList());
        }

        //
        // GET: /Posts/Tag/[tagName]

        public ActionResult Tag( string tagName )
        {
            return View(postRespository.SelectPostsByTag(tagName).ToList());
        }

        // HTTP-GET: /Posts/Details/[id]

        public ActionResult Details( int id )
        {
            ViewData["PageTitle"] = "Details";
            var model = postRespository.SelectPost( id );

            if (model == null)
                return View( "NotFound" );
            else
                return View( "Details", model );
        }

        // HTTP-GET: /Posts/Details/[name]

        public ActionResult Details2( string name )
        {
            ViewData["PageTitle"] = "Details";
            var model = postRespository.SelectPost( name );

            if (model == null)
                return View( "NotFound" );
            else
                return View( "Details", model );
        }
    }
}
