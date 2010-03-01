﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Core.Service.Data;
using StuartClode.Mvc.Extension;
using xVal.ServerSide;
using System.Linq.Expressions;
using StuartClode.Mvc.Service.Data;

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
        public ViewResult Index()
        {
            //Func<Tag, bool> condition = x => x.Name.Contains("Baby");
            //Expression<Func<Tag, bool>> condition2 = x => x.Name == "Baby";

            var condition = PredicateBuilder.False<Tag>();
            condition = condition.Or(x => x.Name == "Baby");
            condition = condition.Or(x => x.Name == "Dress");

            var list = tagService.SelectList().Where(condition).OrderBy(x => x.Name);

            var list2 = tagService.SelectList(condition).OrderBy(x => x.Name);

            var list3 = tagService.SelectList().OrderBy(x => x.Name);

            var model = BuildDefaultViewModel().With( list3 );
            model.PageTitle = "All Tags";

            return View( model );
        }

    }
}
