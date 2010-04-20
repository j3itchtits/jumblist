using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jumblist.Core.Model;
using System.Web.Mvc;
using Jumblist.Core.Service;
using MvcMaps;
using Jumblist.Core.Service.Data;
using Microsoft.Practices.ServiceLocation;

namespace Jumblist.Website.ViewModel
{
    public class PostViewModel<T> : DefaultViewModel<T>
    {
        public PostCategory PostCategory { get; set; }
        public IEnumerable<Tag> Tags { get; set; }
        public User User { get; set; }
        //public Pushpin Pushpin { get; set; }
        public IEnumerable<Pushpin> Pushpins { get; set; }

        public PostViewModel<T> With(PostCategory postCategory)
        {
            this.PostCategory = postCategory;
            return this;
        }

        public PostViewModel<T> With(IEnumerable<Tag> tags)
        {
            this.Tags = tags;
            return this;
        }

        public PostViewModel<T> With(User user)
        {
            this.User = user;
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
    }

    /// <summary>
    /// So you can write 
    /// PostView.Model.WithUser(user);
    /// </summary>
    public class PostView
    {
        public static PostViewModel<T> Model<T>()
        {
            return new PostViewModel<T>();
        }

        public static PostViewModel<Post> Model()
        {
            return new PostViewModel<Post>();
        }

    }
}

