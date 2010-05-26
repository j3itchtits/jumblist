using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Core.Service;
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

        public ViewResult Index( User user, string returnUrl )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Basket";
            model.Basket = user.Session.Basket;
            model.ReturnUrl = returnUrl;

            return View( model );
        }

        public ActionResult Summary( User user )
        {
            return PartialView( "SummaryControl", user.Session.Basket );
        }

        public RedirectToRouteResult AddItem( User user, int id, string returnUrl )
        {
            Post post = postService.SelectRecord( id );
            user.Session.Basket.AddItem( post );
            return RedirectToAction( "Index", new { returnUrl } );
        }

        public RedirectToRouteResult ClearItem( User user, int postId, string returnUrl )
        {
            Post post = postService.SelectRecord( postId );
            user.Session.Basket.ClearItem( post );
            return RedirectToAction( "Index", new { returnUrl } );
        }

        public RedirectToRouteResult ClearAll( User user, string returnUrl )
        {
            user.Session.Basket.ClearAll();
            return RedirectToAction( "Index", new { returnUrl } );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectToRouteResult Email( User user, string returnUrl )
        {
            // Empty carts can't be checked out
            if (user.Session.Basket.Items.Count == 0)
            {
                //ModelState.AddModelError( "Basket", "Sorry, your basket is empty!" );
                Message = new Message { Text = "Sorry, your basket is empty!", StyleClass = "message" };
                return RedirectToAction( "Index", new { returnUrl } );
            }

            basketSubmitter.SubmitBasket( user );
            user.Session.Basket.ClearAll();
            Message = new Message { Text = "Message sent", StyleClass = "message" };

            return RedirectToAction( "Index", new { returnUrl } );
        }
    }
}
