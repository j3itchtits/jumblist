using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Routing;
using StuartClode.Mvc.Extension;

namespace Jumblist.Core.Model
{
    public class CategoryLink : Link
    {
        public CategoryLink( string category, RouteValueDictionary routeValueDic )
        {
            if (category != null)
            {
                Text = category;

                switch (routeValueDic["action"].ToString().ToLower())
                {
                    case "index":
                        routeValueDic["action"] = "category";
                        routeValueDic["id"] = category.FriendlyUrlEncode();
                        break;
                    case "category":
                        routeValueDic["id"] = category.FriendlyUrlEncode();
                        break;
                    default:
                        routeValueDic["category"] = category.FriendlyUrlEncode();
                        break;
                } 
                
                RouteValues = new RouteValueDictionary( routeValueDic );

            }
            else
            {
                Text = "All";

                switch (routeValueDic["action"].ToString().ToLower())
                {
                    case "index":
                        break;
                    case "category":
                        routeValueDic["action"] = "index";
                        routeValueDic["id"] = string.Empty;
                        break;
                    default:
                        routeValueDic["category"] = string.Empty;
                        break;
                } 
                    
                RouteValues = new RouteValueDictionary( routeValueDic );
            }
        }
    }
}
