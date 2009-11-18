using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Entity;

namespace Jumblist.Data.Access
{
    public class SqlFeedRepository : IFeedRepository
    {
        private JumblistDataContext dataContext;

        public SqlFeedRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }


        #region IFeedRepository Members

        public IQueryable<Feed> Feeds
        {
            get { return dataContext.Feeds; }
        }

        public IQueryable<Feed> SelectFeeds()
        {
            return dataContext.Feeds;
        }

        public Feed SelectFeed( int id )
        {
            return dataContext.Feeds.SingleOrDefault( feed => feed.FeedId == id );
        }

        public Feed SelectFeed( string url )
        {
            return dataContext.Feeds.FirstOrDefault( feed => feed.Url == url );
        }

        public void Add( Feed feed )
        {
            throw new NotImplementedException();
        }

        public void Delete( Feed feed )
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
