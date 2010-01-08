using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    public class PagesController : Jumblist.Website.Controller.ControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
