using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Net;

namespace Jumblist.Website.Controllers
{
    public class ErrorController : Controller
    {
        //[AcceptVerbs( HttpVerbs.Get )]
        //public ViewResult NotFound( string aspxerrorpath )
        //{
        //    Response.StatusCode = (int)HttpStatusCode.NotFound;
        //    ViewData["path"] = aspxerrorpath;
        //    return View( "NotFound" );
        //}

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index( string error )
        {
            ViewData["Title"] = "We have dropped the ball on this one.";
            ViewData["Description"] = error;
            return View( "Index" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult HttpError404( string error )
        {
            ViewData["Title"] = "Page Not Found (404)";
            ViewData["Description"] = error;
            return View( "Index" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult HttpError500( string error )
        {
            ViewData["Title"] = "Sorry, an error occurred while processing your request (500)";
            ViewData["Description"] = error;
            return View( "Index" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult General( string error )
        {
            ViewData["Title"] = "Sorry, an error occurred while processing your request";
            ViewData["Description"] = error;
            return View( "Index" );
        }
    }
}
