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

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Index( JumblistSession jumblistSession, string returnUrl )
        {
            var model = DefaultView.CreateModel();
            model.PageTitle = "Basket";
            model.Basket = jumblistSession.Basket;
            model.ReturnUrl = returnUrl;

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Get | HttpVerbs.Head )]
        public PartialViewResult Widget( JumblistSession jumblistSession )
        {
            return PartialView( "BasketWidgetControl", jumblistSession.Basket );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult AddItem( JumblistSession jumblistSession, int id )
        {
            Post post = postService.SelectRecord( id );
            string returnUrl = (Request.IsAjaxRequest()) ? Request.UrlReferrer.PathAndQuery : Request.Url.PathAndQuery;

            jumblistSession.Basket.AddItem( post );
            jumblistSession.Basket.ReturnUrl = returnUrl;

            return PartialView( "BasketWidgetControl", jumblistSession.Basket );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult RemoveItem( JumblistSession jumblistSession, int postId )
        {
            Post post = postService.SelectRecord( postId );
            jumblistSession.Basket.ClearItem( post );

            return PartialView( "BasketItemsControl", jumblistSession.Basket.Items );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public RedirectResult RemoveAll( JumblistSession jumblistSession, string returnUrl )
        {
            jumblistSession.Basket.ClearAll();
            Message = new Message { Text = "All posts removed from basket.", StyleClass = "message" };
            return Redirect( returnUrl ?? "/" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Email( [ModelBinder( typeof( UserModelBinder ) )] User user, JumblistSession jumblistSession, string returnUrl )
        {
            // Empty carts can't be checked out
            if ( jumblistSession.Basket.Items.Count == 0 )
            {
                //ModelState.AddModelError( "Basket", "Sorry, your basket is empty!" );
                Message = new Message { Text = "Sorry, your basket is empty!", StyleClass = "message" };
                return RedirectToAction( "Index", new { returnUrl = returnUrl } );
            }

            mailService.SendBasketEmail( jumblistSession.Basket, user );

            jumblistSession.Basket.ClearAll();
            Message = new Message { Text = "The post details have been emailed to you.", StyleClass = "message" };

            return Redirect( returnUrl ?? "/" );
        }
    }
}
