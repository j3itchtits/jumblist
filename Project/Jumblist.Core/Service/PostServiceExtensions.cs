﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jumblist.Core.Model;
using StuartClode.Mvc.Service;

namespace Jumblist.Core.Service
{
    public static class PostServiceExtensions
    {
        public static Post GetFirstPost( this IDataService<Post> postService )
        {
            return postService.Select(2);
        }

        public static IQueryable<Post> Alphabetical( this IQueryable<Post> posts )
        {
            return posts.OrderBy( p => p.Title );
        }
    }
}
