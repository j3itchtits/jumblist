using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JumblistTest.Core.Model;
using System.Web.Mvc;
using JumblistTest.Core.Service;

namespace JumblistTest.Website.ViewModel
{
    //Use as an alternative to DefaultViewModel - not sure when applicable
    public class PostViewModel : ViewModelBase
    {
        public Post Post { get; set; }
        public IEnumerable<Post> Posts { get; set; }

        public PostCategory Category { get; set; }
        public IEnumerable<PostCategory> Categories { get; set; }

        public User User { get; set; }
        public IEnumerable<User> Users { get; set; }

        public Tag Tag { get; set; }
        public IEnumerable<Tag> Tags { get; set; }

        public PostViewModel WithPost( Post post )
        {
            this.Post = post;
            return this;
        }
    }

    /// <summary>
    /// So you can write 
    /// PostView.Data.WithAuthors(myProducts);
    /// </summary>
    public class PostView
    {
        public static PostViewModel Data { get { return new PostViewModel(); } }
    }
}

