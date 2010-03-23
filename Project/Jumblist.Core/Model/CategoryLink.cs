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
        public CategoryLink(string category)
        {
            if (category != null)
            {
                Text = category;
                //RouteValues = new RouteValueDictionary(new
                //{
                //    controller = "posts",
                //    action = "category",
                //    id = category.FriendlyUrlEncode()
                //});
            }
            else
            {
                Text = "All";
                //RouteValues = new RouteValueDictionary(new
                //{
                //    controller = "posts",
                //    action = "index"
                //});
            }
        }
    }
}
