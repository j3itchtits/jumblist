using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Core.Service.Data;
using StuartClode.Mvc.Extension;
using xVal.ServerSide;

namespace Jumblist.Website.Controllers
{
    public class TagsController : ViewModelController<Tag>
    {
        private readonly ITagService tagService;

        public TagsController( ITagService tagService )
        {
            this.tagService = tagService;
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ActionResult Index()
        {
            return RedirectToAction( "list" );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult List()
        {
            var list = tagService.SelectList();

            var model = BuildDefaultViewModel().With( list );
            model.PageTitle = "All Tags";

            return View( model );
        }
    }
}
