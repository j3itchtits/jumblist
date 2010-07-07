using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jumblist.Core.Model;
using System.Web.Mvc;
using Jumblist.Core.Service;
using MvcMaps;
using Microsoft.Practices.ServiceLocation;
using System.Collections;

namespace Jumblist.Website.ViewModel
{
    public class PostViewModel : DefaultViewModel<Post>
    {
        public PostCategory PostCategory { get; set; }
        public IEnumerable<Tag> Tags { get; set; }
        public Feed Group { get; set; }
        public IEnumerable<Location> Locations { get; set; }
        public IEnumerable<Pushpin> Pushpins { get; set; }
        public string Q { get; set; }


        public PostViewModel With( PostCategory postCategory )
        {
            this.PostCategory = postCategory;
            return this;
        }

        public PostViewModel With( IEnumerable<Tag> tags )
        {
            this.Tags = tags;
            return this;
        }

        public PostViewModel With( IEnumerable<Pushpin> pushpins )
        {
            this.Pushpins = pushpins;
            return this;
        }


    }

    /// <summary>
    /// 
    /// </summary>
    public class PostView
    {
        public static PostViewModel CreateModel()
        {
            return new PostViewModel();
        }
    }
}

