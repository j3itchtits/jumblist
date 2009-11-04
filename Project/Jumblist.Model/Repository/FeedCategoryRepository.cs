using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Interface;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Repository
{
    public class FeedCategoryRepository : IFeedCategoryRepository
    {
        private JumblistDataContext dataContext;

        public FeedCategoryRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }

        #region IFeedCategoryRepository Members

        public IQueryable<FeedCategory> FeedCategories
        {
            get { return dataContext.FeedCategories; }
        }

        public IQueryable<FeedCategory> SelectFeedCategories()
        {
            return dataContext.FeedCategories;
        }

        public FeedCategory SelectFeedCategory( int id )
        {
            return dataContext.FeedCategories.SingleOrDefault( category => category.FeedCategoryId == id );
        }

        public FeedCategory SelectFeedCategory( string name )
        {
            return dataContext.FeedCategories.FirstOrDefault( category => category.Name == name );
        }

        public void Add( FeedCategory feedCategory )
        {
            throw new NotImplementedException();
        }

        public void Delete( FeedCategory feedCategory )
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
