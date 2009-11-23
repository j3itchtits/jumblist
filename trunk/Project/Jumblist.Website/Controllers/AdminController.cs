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
        private ITempRepository tempRepository;

        public AdminController( IPostRepository postRepository, ITagRepository tagRepository, ITempRepository tempRepository )
        {
            this.postRepository = postRepository;
            this.tagRepository = tagRepository;
            this.tempRepository = tempRepository;
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
        public ViewResult CreateTag()
        {
            return View( "EditTag", new Tag() );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult EditTag( int tagId )
        {
            Tag tag = tagRepository.SelectTag( tagId );
            return View( tag );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult SaveTag( Tag tag )
        {
            Tag original = tagRepository.SelectTag( tag.TagId );

            if (original != null)
                UpdateModel( original );

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

        public ActionResult Temp()
        {
            var tempList = tempRepository.Temp.ToList();
            return View( tempList );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult CreateTemp()
        {
            return View( "EditTemp", new Temp() );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult EditTemp( int tempId )
        {
            Temp temp = tempRepository.SelectTemp( tempId );
            return View( temp );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult SaveTemp( Temp temp )
        {
            Temp original = tempRepository.SelectTemp( temp.TempId );

            if (original != null)
                UpdateModel( original );

            if (ModelState.IsValid)
            {
                tempRepository.Save( temp );
                TempData["message"] = temp.Name + " has been saved.";
                return RedirectToAction( "Temp" );
            }
            else
            {
                return View( temp );
            }
        }
    }
}
