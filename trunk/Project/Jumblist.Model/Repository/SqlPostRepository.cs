using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Abstract;
using Jumblist.Model.Entity;
using System.Data.Linq;

namespace Jumblist.Model.Repository
{
    public class SqlPostRepository : IPostRepository
    {
        private Table<Post> postTable;

        public SqlPostRepository( string connectionString )
        {
            postTable = (new DataContext(connectionString)).GetTable<Post>();
        }

        #region IPostRepository Members

        public IQueryable<Post> PostList
        {
            get { return postTable; }
        }

        #endregion
    }
}
