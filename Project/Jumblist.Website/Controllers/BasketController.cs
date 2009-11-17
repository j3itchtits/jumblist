using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Model.Interface;
using Jumblist.Model.Entity;

namespace Jumblist.Website.Controllers
{
    public class BasketController : Controller
    {
        private IPostRepository postRespository;

        public BasketController( IPostRepository postRespository )
        {
            this.postRespository = postRespository;
        }

        public ViewResult Index( Basket basket, string returnUrl )
        {
            ViewData["ReturnUrl"] = returnUrl;
            ViewData["PostCategory"] = "Basket";
            return View( "Index", basket );
        }

        public ViewResult Summary( Basket basket )
        {
            return View( "Summary", basket );
        }

        public RedirectToRouteResult AddItem( Basket basket, int postId, string returnUrl )
        {
            Post post = postRespository.SelectPost( postId );
            basket.AddItem( post );
            return RedirectToAction( "Index", new { returnUrl } );
        }

        public RedirectToRouteResult ClearItem( Basket basket, int postId, string returnUrl )
        {
            Post post = postRespository.SelectPost( postId );
            basket.ClearItem( post );
            return RedirectToAction( "Index", new { returnUrl } );
        }

        public RedirectToRouteResult ClearAll( Basket basket, string returnUrl )
        {
            basket.ClearAll();
            return RedirectToAction( "Index", new { returnUrl } );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult EmailBasket( Basket basket, string returnUrl )
        {
            return View( "EmailBasket", basket.BasketUser );
        }
    }
}
