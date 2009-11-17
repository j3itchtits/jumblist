﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Interface;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Repository
{
    public class TagRepository : ITagRepository
    {
        private JumblistDataContext dataContext;

        public TagRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }
        //Comment
        #region ITagRepository Members

        public IQueryable<Tag> SelectTags()
        {
            return dataContext.Tags;
        }

        public IQueryable<Tag> SelectTopLevelTags()
        {
            return from t in dataContext.Tags
                   where t.ParentId == 0
                   select t;
        }

        public Tag SelectTag( int id )
        {
            return dataContext.Tags.SingleOrDefault( tag => tag.TagId == id ); 
        }

        public Tag SelectTag( string name )
        {
            return dataContext.Tags.FirstOrDefault( tag => tag.Name == name ); 
        }

        public void Add( Tag tag )
        {
            throw new NotImplementedException();
        }

        public void Delete( Tag tag )
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