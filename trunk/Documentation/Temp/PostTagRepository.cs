using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Interface;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Repository
{
    public class PostTagRepository : IPostTagRepository
    {
        private JumblistDataContext dataContext;

        public PostTagRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }


        #region IPostTagRepository Members

        public IQueryable<PostTag> PostTags
        {
            get { return dataContext.PostTags; }
        }

        public IQueryable<PostTag> SelectPostTags()
        {
            return dataContext.PostTags;
        }

        public IQueryable<PostTag> SelectPostTags( Post post )
        {
            return from p in dataContext.PostTags
                   where p.PostId == post.PostId
                   select p;
        }

        public IQueryable<PostTag> SelectPostTags( Tag tag )
        {
            return from p in dataContext.PostTags
                   where p.TagId == tag.TagId
                   select p;
        }

        #endregion
    }
}
