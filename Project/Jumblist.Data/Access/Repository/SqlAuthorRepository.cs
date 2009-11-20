using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Entity;

namespace Jumblist.Data.Access
{
    public class SqlAuthorRepository : IAuthorRepository
    {
        private JumblistDataContext dataContext;

        //public SqlAuthorRepository()
        //{
        //    dataContext = new JumblistDataContext( ConnectionString );
        //}

        public SqlAuthorRepository( string connectionString )
        {
            dataContext = new JumblistDataContext( connectionString );
        }

        #region IAuthorRepository Members

        public IQueryable<Author> Authors
        {
            get { return dataContext.Authors; }
        }

        public IQueryable<Author> SelectAuthors()
        {
            return dataContext.Authors;
        }

        public Author SelectAuthor(int id)
        {
            return dataContext.Authors.SingleOrDefault(author => author.AuthorId == id);
        }

        public Author SelectAuthor(string name)
        {
            return dataContext.Authors.FirstOrDefault(author => author.Name == name);
        }

        public void Add(Author author)
        {
            throw new NotImplementedException();
        }

        public void Delete(Author author)
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
