using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Data.Access;
using Jumblist.Data.Entity;

namespace Jumblist.Website.Controllers
{
    public class AdminController : Controller
    {
        private IPostRepository postRepository;

        public AdminController( IPostRepository postRepository )
        {
            this.postRepository = postRepository;
        }

        public ActionResult Index()
        {
            return View( "Index" );
        }

        public ActionResult Posts()
        {
            var postList = postRepository.Posts.ToList();
            return View( "Posts", postList );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult PostEdit( int postId )
        {
            Post post = postRepository.SelectPost( postId );
            return View( "PostEdit", post );
        }
        //
        // GET: /Admin/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Admin/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Admin/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
