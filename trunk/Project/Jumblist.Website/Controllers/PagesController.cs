using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace Jumblist.Website.Controllers
{
    public class PagesController : Controller
    {
        

        //
        // GET: /Home/

        public ViewResult Index()
        {
            return View();
        }

        public ViewResult About()
        {
            return View();
        }

        public ViewResult Help()
        {
            return View();
        }

    }
}
