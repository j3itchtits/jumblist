using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Website.Filter;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    [CustomAuthorization( RoleLevels = RoleLevel.Administrator | RoleLevel.Editor )]
    public class HomeController : RootControllerBase
    {
        [LoadFeeds]
        public ActionResult Index()
        {
            return View();
        }
    }
}
