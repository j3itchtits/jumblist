using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Jumblist.Website.Extension
{
    public static class RouteCollectionExtensions
    {
        public static void JumblistMapRoute( this RouteCollection routes, string name, string url, object defaults )
        {
            routes.JumblistMapRoute( name, url, defaults, null, null );
        }

        public static void JumblistMapRoute( this RouteCollection routes, string name, string url, object defaults, string[] namespaces )
        {
            routes.JumblistMapRoute( name, url, defaults, namespaces, null );
        }

        public static void JumblistMapRoute( this RouteCollection routes, string name, string url, object defaults, string[] namespaces, object constraints )
        {
            if ( routes == null )
                throw new ArgumentNullException( "routes" );

            if ( url == null )
                throw new ArgumentNullException( "url" );

            var route = new JumblistRoute( url, new MvcRouteHandler() )
            {
                Defaults = new RouteValueDictionary( defaults ),
                Constraints = new RouteValueDictionary( constraints ),
                DataTokens = new RouteValueDictionary()
            };

            if ( (namespaces != null) && (namespaces.Length > 0) )
            {
                route.DataTokens["Namespaces"] = namespaces;
            }

            if ( String.IsNullOrEmpty( name ) )
                routes.Add( route );
            else
                routes.Add( name, route );
        }
    }

    public class JumblistRoute : Route
    {
        public JumblistRoute( string url, IRouteHandler routeHandler )
            : base( url, routeHandler ) { }

        public JumblistRoute( string url, RouteValueDictionary defaults, IRouteHandler routeHandler )
            : base( url, defaults, routeHandler )
        { }

        public override VirtualPathData GetVirtualPath( RequestContext requestContext, RouteValueDictionary values )
        {
            var path = base.GetVirtualPath( requestContext, values );
            if ( path != null )
            {
                path.VirtualPath = path.VirtualPath.Replace( "%20", "+" );
            }
            return path;
        }
    }
}
