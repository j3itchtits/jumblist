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
        private ITagRepository tagRepository;

        public AdminController( IPostRepository postRepository, ITagRepository tagRepository )
        {
            this.postRepository = postRepository;
            this.tagRepository = tagRepository;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Posts()
        {
            var postList = postRepository.Posts.ToList();
            return View( postList );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult EditPost( int postId )
        {
            Post post = postRepository.SelectPost( postId );
            return View( post );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult EditPost( Post post )
        {
            if (ModelState.IsValid)
            {
                postRepository.Save( post );
                TempData["message"] = post.Title + " has been saved.";
                return RedirectToAction( "Posts" );
            }
            else
            {
                return View( post );
            }
        }

        public ActionResult Tags()
        {
            var tagList = tagRepository.Tags.ToList();
            return View( tagList );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult EditTag( int tagId )
        {
            Tag tag = tagRepository.SelectTag( tagId );
            return View( tag );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult EditTag( Tag tag )
        {
            if (ModelState.IsValid)
            {
                tagRepository.Save( tag );
                TempData["message"] = tag.Name + " has been saved.";
                return RedirectToAction( "Tags" );
            }
            else
            {
                return View( tag );
            }
        }
    }
}
