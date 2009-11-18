using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Data.Access;
using Jumblist.Website.Helpers;
using Jumblist.Data.Entity;
using Jumblist.Website.Services.Paging;

namespace Jumblist.Website.Controllers
{
    public class TagsController : Controller
    {
        private int pageSize = 10;
        private ITagRepository tagRespository;

        public TagsController( ITagRepository tagRespository )
        {
            this.tagRespository = tagRespository;
        }

        public int PageSize
        {
            get { return pageSize; }
            set { pageSize = value; }
        }

        //
        // GET: /Tags/List/[parameter1]

        public ViewResult List( int? parameter1 )
        {
            var tagList = tagRespository.SelectTags();

            var pagedTagList = new PaginatedList<Tag>( tagList.ToList(), (parameter1 ?? 1), PageSize );

            return View( pagedTagList );

        }
    }
}
