﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jumblist.Core.Model;
using Jumblist.Website.Controllers;
using Jumblist.Core.Service.Data;
using xVal.ServerSide;

namespace Jumblist.Website.Areas.Admin.Controllers
{
    public class TagsController : ViewModelController<Tag>
    {
        private ITagService tagService;

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

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Create()
        {
            var model = BuildDataEditDefaultViewModel().With( new Tag() );
            model.PageTitle = "Create a new post";
            model.Message = new Message { Text = "You are about to create a post", StyleClass = "message" };

            return View( "Edit", model );
        }

        [AcceptVerbs( HttpVerbs.Get )]
        public ViewResult Edit( int id )
        {
            var item = tagService.Select( id );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        public ActionResult Save( Tag item )
        {
            try
            {
                tagService.Save( item );
            }
            catch (RulesException ex)
            {
                ex.AddModelStateErrors( ModelState, "Item" );
            }

            if (ModelState.IsValid)
            {
                Message = new Message { Text = item.Name + " has been saved.", StyleClass = "message" };
                return RedirectToAction( "list" );
            }
            else
            {
                var model = BuildDataEditDefaultViewModel().With( item );
                model.PageTitle = string.Format( "Edit - {0}", item.Name );
                model.Message = new Message { Text = "Something went wrong", StyleClass = "error" };
                return View( "edit", model );
            }
        }

        [AcceptVerbs( HttpVerbs.Delete )]
        public ActionResult Delete( int id )
        {
            var feed = tagService.Select( id );
            tagService.Delete( feed );

            var list = tagService.SelectList();

            return PartialView( "ListPartial", list );
        }
    }
}