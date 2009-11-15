using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using Jumblist.Website.Helpers;

namespace Jumblist.Website.Services.Navigation
{
    public class CategoryLink : Link
    {
        public CategoryLink( string category )
        {
            if ( category != null )
            {
                Text = category;
                RouteValues = new RouteValueDictionary( new
                {
                    controller = "posts",
                    action = "category",
                    parameter1 = UrlEncoderHelper.GenerateFriendlyUrl( category )
                } );
            }
            else
            {
                Text = "All";
                RouteValues = new RouteValueDictionary( new
                {
                    controller = "posts",
                    action = "list"
                } );
            }
        }
    }
}
