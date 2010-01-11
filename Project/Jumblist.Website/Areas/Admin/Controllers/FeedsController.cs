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
    [CustomAuthorization( RoleLevelMinimum = RoleLevel.Editor )]
    public class FeedsController : ViewModelController<Feed>
    {
        //
        // GET: /AdminFeeds/

        public ActionResult Index()
        {
            return View();
        }

    }
}
