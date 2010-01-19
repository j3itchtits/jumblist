using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Jumblist.Core.Model;
using Jumblist.Core.Service;

namespace Jumblist.Core.Extension
{
    public static class PostExtensions
    {
        public static Post GetFirstPost( this IPostService postService )
        {
            return postService.Select(2);
        }

        public static IQueryable<Post> Alphabetical( this IQueryable<Post> posts )
        {
            return posts.OrderBy( p => p.Title );
        }
    }
}
