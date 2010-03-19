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
        private readonly IUserService userService = ServiceLocator.Current.GetInstance<IUserService>();
        private User user;

        public Pushpin Pushpin { get; set; }
        public IEnumerable<Pushpin> Pushpins { get; set; }

        public User User
        {
            get 
            {
                var user = (HttpContext.Current.User.Identity.IsAuthenticated) ? userService.SelectRecord(HttpContext.Current.User.Identity.Name) : User.Anonymous;
                return user;
            }
            set { user = value; }
        }

        public PostViewModel<T> With( User user )
        {
            this.User = user;
            return this;
        }

        public PostViewModel<T> With(Pushpin pushpin)
        {
            this.Pushpin = pushpin;
            return this;
        }

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

