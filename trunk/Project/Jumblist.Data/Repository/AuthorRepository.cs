﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Interface;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Repository
{
    public class AuthorRepository : IAuthorRepository
    {
        private JumblistDataContext dataContext;

        public AuthorRepository(string connectionString)
        {
            dataContext = new JumblistDataContext(connectionString);
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
