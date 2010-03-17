using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jumblist.Core.Model;
using System.Web.Mvc;
using Jumblist.Core.Service;

namespace Jumblist.Website.ViewModel
{
    public class PostViewModel<T> : DefaultViewModel<T>
    {
        public User User { get; set; }
        public IEnumerable<User> Users { get; set; }

        public PostViewModel<T> WithUser( User user )
        {
            this.User = user;
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

        public static PostViewModel<Post> Model 
        { 
            get { return new PostViewModel<Post>(); } 
        }
    }
}

