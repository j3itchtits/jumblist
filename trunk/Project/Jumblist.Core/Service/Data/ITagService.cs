using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service.Data
{
    public interface ITagService
    {
        IQueryable<Tag> SelectList();
        IQueryable<Tag> SelectList(Expression<Func<Tag, bool>> condition);
        IQueryable<Tag> SelectList( string[] tagList );
        Tag Select( int id );
        Tag Select(string name);
        void Save( Tag entity );
        void Update(Tag entity);
        void Delete( Tag entity );
        string[] FindTags(string q);
    }
}
