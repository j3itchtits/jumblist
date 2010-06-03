using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jumblist.Core.Model;
using System.Web.Mvc;
using Jumblist.Core.Service;
using MvcMaps;
using Microsoft.Practices.ServiceLocation;

namespace Jumblist.Website.ViewModel
{
    public class PostViewModel<T> : DefaultViewModel<T>
    {
        public PostViewModel() 
        {
            PostCategoryList = BuildPostCategorySelectList();
        }

        //private PostCategory postCategory;
        //private IEnumerable<Tag> tags;

        //public PostCategory PostCategory
        //{
        //    get { return postCategory; }
        //    set { postCategory = (value != null) ? value : new PostCategory(); }
        //}

        public PostCategory PostCategory { get; set; }
        public IEnumerable<Tag> Tags { get; set; }

        //public IEnumerable<Tag> Tags 
        //{
        //    get { return tags; }
        //    set { tags = (value != null) ? value : new List<Tag>() as IEnumerable<Tag>; }
        //}

        public Feed Group { get; set; }
        public IEnumerable<Location> Locations { get; set; }
        //public Pushpin Pushpin { get; set; }
        public IEnumerable<Pushpin> Pushpins { get; set; }
        public IEnumerable<SelectListItem> PostCategoryList { get; set; }
        public string Q { get; set; }

        public PostViewModel<T> With( PostCategory postCategory )
        {
            this.PostCategory = postCategory;
            return this;
        }

        public PostViewModel<T> With( IEnumerable<Tag> tags )
        {
            this.Tags = tags;
            return this;
        }

        //public PostViewModel<T> With(Pushpin pushpin)
        //{
        //    this.Pushpin = pushpin;
        //    return this;
        //}

        public PostViewModel<T> With(IEnumerable<Pushpin> pushpins)
        {
            this.Pushpins = pushpins;
            return this;
        }

        private IEnumerable<SelectListItem> BuildPostCategorySelectList()
        {
            SelectListItem all = new SelectListItem() { Text = "All", Value = "" };
            SelectListItem offered = new SelectListItem() { Text = "Offered", Value = "offered" };
            SelectListItem wanted = new SelectListItem() { Text = "Wanted", Value = "wanted" };
            return new[] { all, offered, wanted };
        }
    }

    /// <summary>
    /// So you can write 
    /// PostView.CreateModel.WithUser(user);
    /// </summary>
    public class PostView
    {
        public static PostViewModel<T> CreateModel<T>()
        {
            return new PostViewModel<T>();
        }
    }
}

