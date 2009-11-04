using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Interface
{
    public interface IPostTagRepository
    {
        //Query Lists
        IQueryable<PostTag> PostTags { get; }
        IQueryable<PostTag> SelectPostTags();
        IQueryable<PostTag> SelectPostTags( Post post );
        IQueryable<PostTag> SelectPostTags( Tag tag );
    }
}
