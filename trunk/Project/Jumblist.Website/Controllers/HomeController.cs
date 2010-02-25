using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Jumblist.Website.Controllers
{
    public class HomeController : RootControllerBase
    {
        public ViewResult Index()
        {
            return View();
        }

        public ViewResult About()
        {
            return View();
        }

        public string Help()
        {

            var table = new[] 
            {
                new { uid = 1 },
                new { uid = 2 },
                new { uid = 3 },
                new { uid = 4 },
                new { uid = 5 }
            };

            var search = new[] { "1", "5", "10" };

            //var results = from x in table
            //              where search.Contains( x.uid.ToString() )
            //              select x;

            var results = table.Where( x => search.Contains( x.uid.ToString() ) );

            string output = string.Empty;

            foreach (var result in results)
            {
                output += "Result: " + result.uid.ToString() + ", ";
            }



            return output;
        }
    }
}
