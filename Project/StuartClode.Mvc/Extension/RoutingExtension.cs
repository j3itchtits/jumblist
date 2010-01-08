using System.Web.Routing;
using System.Web.Mvc;
using System;

namespace StuartClode.Mvc.Extension
{
    public static class RoutingExtension
    {
        public static void CreateArea( this RouteCollection routes, string areaName, string controllersNamespace, params Route[] routeEntries )
        {
            foreach ( var route in routeEntries )
            {
                if ( route.Constraints == null ) route.Constraints = new RouteValueDictionary();
                if ( route.Defaults == null ) route.Defaults = new RouteValueDictionary();
                if ( route.DataTokens == null ) route.DataTokens = new RouteValueDictionary();

                route.Constraints.Add( "area", areaName );
                route.Defaults.Add( "area", areaName );
                route.DataTokens.Add( "namespaces", new string[] { controllersNamespace } );

                if ( !routes.Contains( route ) ) // To support "new Route()" in addition to "routes.MapRoute()"
                    routes.Add( route );
            }
        }
    }
}
