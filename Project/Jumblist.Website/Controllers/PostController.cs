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

        public PostsController()
        {
            postRespository = new SqlPostRepository( ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString );
            //postRespository = new FakePostRepository();
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

    }
}
