using System;
using System.Linq;
using System.Data.Linq;
using System.Linq.Expressions;
using System.Collections;
using System.Collections.Generic;

namespace StuartClode.Mvc.Repository
{
    public interface IRepository<T> where T : class
    {
        DataContext DataContext { get; }
        IQueryable<T> SelectRecordList();
        IQueryable<T> SelectRecordList( Expression<Func<T, bool>> whereCondition );
        T SelectRecord( int id );
        T SelectRecord( Expression<Func<T, bool>> whereCondition );
        //T Select( string name );
        void InsertOnSubmit( T entity );
        void InsertAllOnSubmit( IEnumerable<T> entities );
        void DeleteOnSubmit( T entity );
        void DeleteAllOnSubmit( IEnumerable<T> entities );
        //void Save( T entity );
        void Attach( T entity );
        void SubmitChanges();
    }

    public interface IRepository
    {
        DataContext DataContext { get; }
        IQueryable SelectRecordList();
        object SelectRecord( int id );
        //object Select( string name );
        void InsertOnSubmit( object entity );
        void InsertAllOnSubmit( IEnumerable entities );
        void DeleteOnSubmit( object entity );
        void DeleteAllOnSubmit( IEnumerable entities );
        //void Save( object entity );
        void SubmitChanges();
    }
}
