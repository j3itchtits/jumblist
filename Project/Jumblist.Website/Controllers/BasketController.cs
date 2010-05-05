using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
using Jumblist.Core.Service.Basket;
using Jumblist.Website.ViewModel;
using StuartClode.Mvc.Service.Data;

namespace Jumblist.Website.Controllers
{
    public class BasketController : BaseController
    {
        private readonly IDataService<Post> postService;
        private readonly IBasketSubmitter basketSubmitter;

        public BasketController( IDataService<Post> postService, IBasketSubmitter basketSubmitter )
        {
            this.postService = postService;
            this.basketSubmitter = basketSubmitter;
        }

        public ViewResult Index( Basket basket, string returnUrl )
        {
            ViewData["ReturnUrl"] = returnUrl;
            ViewData["PostCategory"] = "Basket";
            return View( "Index", basket );
        }

        public ActionResult Summary( Basket basket )
        {
            return PartialView( "SummaryControl", basket );
        }

        public RedirectToRouteResult AddItem( Basket basket, int postId, string returnUrl )
        {
            Post post = postService.SelectRecord( postId );
            basket.AddItem( post );
            return RedirectToAction( "Index", new { returnUrl } );
        }

        public RedirectToRouteResult ClearItem( Basket basket, int postId, string returnUrl )
        {
            Post post = postService.SelectRecord( postId );
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
