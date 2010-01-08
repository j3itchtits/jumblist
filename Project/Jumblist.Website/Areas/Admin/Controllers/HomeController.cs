using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    public class HomeController : RootController
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
