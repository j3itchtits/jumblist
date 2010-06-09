using System.Web.Mvc;

namespace Jumblist.Website.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea( AreaRegistrationContext context )
        {
            context.MapRoute(
                null,
                "admin/{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = "" },
                new string[] { "Jumblist.Website.Areas.Admin.Controllers" }
            );
        }
    }
}
