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
using Jumblist.Website.ModelBinder;

namespace Jumblist.Website.Controllers
{
    public class BasketController : BaseController
    {
        private readonly IDataService<Post> postService;
        private readonly IMailService mailService;

        public BasketController( IDataService<Post> postService, IMailService mailService )
        {
            this.postService = postService;
            this.mailService = mailService;
        }

        public ViewResult Index( [ModelBinder( typeof( UserModelBinder ) )] User user, string returnUrl )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Basket";
            model.Basket = user.Session.Basket;
            model.ReturnUrl = returnUrl;

            return View( model );
        }

        public ActionResult Summary( [ModelBinder( typeof( UserModelBinder ) )] User user )
        {
            return PartialView( "BasketItemsControl", user.Session.Basket );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult AddItem( [ModelBinder( typeof( UserModelBinder ) )] User user, int id )
        {
            Post post = postService.SelectRecord( id );
            string returnUrl = (Request.IsAjaxRequest()) ? Request.UrlReferrer.PathAndQuery : Request.Url.PathAndQuery;

            user.Session.Basket.AddItem( post );
            user.Session.Basket.ReturnUrl = returnUrl;

            return PartialView( "BasketItemsControl", user.Session.Basket );
        }

        public RedirectToRouteResult ClearItem( [ModelBinder( typeof( UserModelBinder ) )] User user, int postId, string returnUrl )
        {
            Post post = postService.SelectRecord( postId );
            user.Session.Basket.ClearItem( post );
            return RedirectToAction( "Index", new { returnUrl = returnUrl } );
        }

        public RedirectToRouteResult ClearAll( [ModelBinder( typeof( UserModelBinder ) )] User user, string returnUrl )
        {
            user.Session.Basket.ClearAll();
            return RedirectToAction( "Index", new { returnUrl = returnUrl } );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Email( [ModelBinder( typeof( UserModelBinder ) )] User user, string returnUrl )
        {
            // Empty carts can't be checked out
            if (user.Session.Basket.Items.Count == 0)
            {
                //ModelState.AddModelError( "Basket", "Sorry, your basket is empty!" );
                Message = new Message { Text = "Sorry, your basket is empty!", StyleClass = "message" };
                return RedirectToAction( "Index", new { returnUrl = returnUrl } );
            }

            mailService.SendBasketEmail( user );

            user.Session.Basket.ClearAll();
            Message = new Message { Text = "Message sent", StyleClass = "message" };

            return Redirect( returnUrl ?? "/" );
        }
    }
}
