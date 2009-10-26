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
    public class PostController : Controller
    {
        private IPostRepository postRespository;

        public PostController()
        {
            postRespository = new SqlPostRepository( ConfigurationManager.ConnectionStrings["JumblistDatabaseConnectionString"].ConnectionString );
            //postRespository = new FakePostRepository();
        }

        //
        // GET: /Post/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List()
        {
            return View(postRespository.SelectPosts().ToList());
        }

    }
}
