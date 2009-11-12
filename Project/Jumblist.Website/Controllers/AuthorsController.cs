using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Jumblist.Model.Interface;
using Jumblist.Website.Helpers;
using Jumblist.Model.Entity;

namespace Jumblist.Website.Controllers
{
    public class AuthorsController : Controller
    {

        private int pageSize = 5;
        private IAuthorRepository authorRepository;

        public AuthorsController( IAuthorRepository authorRepository )
        {
            this.authorRepository = authorRepository;
        }

        public int PageSize
        {
            get { return pageSize; }
            set { pageSize = value; }
        }

        //
        // GET: /Locations/List/[parameter1]

        public ViewResult List( int? parameter1 )
        {
            var authorList = authorRepository.Authors;

            var pagedAuthorList = new PaginatedList<Author>( authorList.ToList(), ( parameter1 ?? 1 ), PageSize );

            return View( "List", pagedAuthorList );
        }


    }
}
