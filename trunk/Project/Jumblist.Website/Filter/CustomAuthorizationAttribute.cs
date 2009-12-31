using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Jumblist.Website.Filter
{
    public class CustomAuthorizationAttribute : AuthorizeAttribute
    {
        public new string Roles { get; set; }
        public new string Users { get; set; }
    }
}
