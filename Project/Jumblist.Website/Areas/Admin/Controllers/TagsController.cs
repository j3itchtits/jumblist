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
            var list = tagService.SelectRecordList();

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
            var item = tagService.SelectRecord( id );

            var model = BuildDataEditDefaultViewModel().With( item );
            model.PageTitle = string.Format( "Edit - {0}", item.Name );
            model.Message = new Message { Text = "You are about to edit something", StyleClass = "message" };

            return View( model );
        }

        [AcceptVerbs( HttpVerbs.Post )]
        [ValidateInput( false )]
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
            var feed = tagService.SelectRecord( id );
            tagService.Delete( feed );

            var list = tagService.SelectRecordList();

            return PartialView( "TagList", list );
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ContentResult AjaxFindTags(string q)
        {
            var tags = tagService.SelectTagNameList(q);

            //return raw text, one result on each line
            return Content(string.Join("\n", tags));
        } 
    }
}
