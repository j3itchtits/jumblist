using Jumblist.Core.Model;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service.Data
{
    public interface IFeedService
    {
        IQueryable<Feed> SelectList();
        IQueryable<Feed> SelectList(Expression<Func<Feed, bool>> whereCondition);
        Feed Select( int id );
        void Save( Feed entity );
        void Update(Feed entity);
        void Delete( Feed entity );
    }
}
