using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data.Linq;
using System.Linq.Expressions;

namespace StuartClode.Mvc.Service.Data
{
    public interface IDataService<T> where T : class
    {
        DataContext DataContext { get; }
        IQueryable<T> SelectRecordList();
        IQueryable<T> SelectRecordList( Expression<Func<T, bool>> whereCondition );
        T SelectRecord( int id );
        T SelectRecord( Expression<Func<T, bool>> whereCondition );
        void Save( T entity );
        void Save( T entity, bool isDetachedFromDatabase );
        void InsertAll( IEnumerable<T> entities );
        void Delete( T entity );
        void DeleteAll( IEnumerable<T> entities );
        bool IsNew( T entity );
        bool IsDuplicate( Expression<Func<T, bool>> whereCondition );
        bool IsDuplicate( IQueryable<T> list, Expression<Func<T, bool>> whereCondition );
        void ValidateDataRules( object entity );
    }

    public interface IDataService
    {
        DataContext DataContext { get; }
        IQueryable SelectRecordList();
        object SelectRecord( int id );
        void Save( object entity );
        void Save( object entity, bool isDetachedFromDatabase );
        void InsertAll( IEnumerable entities );
        void Delete( object entity );
        void DeleteAll( IEnumerable entities );
    }
}
