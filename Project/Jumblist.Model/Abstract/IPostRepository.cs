using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Abstract
{
    public interface IPostRepository
    {
        IQueryable<Post> PostList { get; }
    }
}
