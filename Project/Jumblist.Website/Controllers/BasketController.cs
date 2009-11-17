using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Data.DataAccess.Interface;
using Jumblist.Data.Model;
using Jumblist.Data.Services;

namespace Jumblist.Website.Controllers
{
    public class BasketController : Controller
    {
        private IPostRepository postRespository;
        private IBasketSubmitter basketSubmitter;

        public BasketController( IPostRepository postRespository, IBasketSubmitter basketSubmitter )
        {
            this.postRespository = postRespository;
            this.basketSubmitter = basketSubmitter;
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
        public ViewResult Email( Basket basket, string returnUrl )
        {
            return View( "Email", basket.BasketUser );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ViewResult Email( Basket basket, FormCollection form )
        {
            // Empty carts can't be checked out
            if (basket.Items.Count == 0)
            {
                ModelState.AddModelError( "Basket", "Sorry, your basket is empty!" );
                return View( "Email" );
            }

            // Invoke model binding manually
            if (TryUpdateModel( basket.BasketUser, form.ToValueProvider() ))
            {
                basketSubmitter.SubmitBasket( basket );
                basket.ClearAll();
                return View( "Completed" );
            }
            else // Something was invalid
                return View( "Email" );
        }
    }
}
