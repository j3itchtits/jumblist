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
        //public ViewResult Error()
        //{
        //    Response.StatusCode = (int)HttpStatusCode.InternalServerError;
        //    return View( "Error" );
        //}

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult NotFound( string aspxerrorpath )
        {
            Response.StatusCode = (int)HttpStatusCode.NotFound;
            ViewData["path"] = aspxerrorpath;
            return View( "NotFound" );
        }

    }
}
