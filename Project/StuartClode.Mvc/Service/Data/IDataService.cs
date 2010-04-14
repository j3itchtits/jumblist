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
        void Update( T entity );
        void Delete( T entity );
        bool IsNew( T entity );
        bool IsDuplicate( Expression<Func<T, bool>> whereCondition );
        bool IsDuplicate( IQueryable<T> list, Expression<Func<T, bool>> whereCondition );
    }

    public interface IDataService
    {
        DataContext DataContext { get; }
        IQueryable SelectRecordList();
        object SelectRecord( int id );
        void Save( object entity );
        void Update( object entity );
        void Delete( object entity );
    }
}
