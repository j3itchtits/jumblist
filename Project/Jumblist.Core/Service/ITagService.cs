using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using System.Linq.Expressions;
using System;

namespace Jumblist.Core.Service
{
    public interface ITagService
    {
        IQueryable<Tag> SelectRecordList();
        IQueryable<Tag> SelectRecordList( Expression<Func<Tag, bool>> whereCondition );
        Tag SelectRecord( int id );
        Tag SelectRecord( Expression<Func<Tag, bool>> whereCondition );
        Tag SelectRecord( string name );
        void Save( Tag entity );
        void Save( Tag entity, bool isDetachedFromDatabase );
        void Delete( Tag entity );
        string[] SelectTagNameList();
        string[] SelectTagNameList( string q );
    }
}
