using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Security;

namespace JumblistTest.Website.Controller
{
    public class PagesController : ControllerBase
    {
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
