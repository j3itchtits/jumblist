using System;
using System.Linq;
using System.Data.Linq;
using System.Linq.Expressions;

namespace StuartClode.Mvc.Repository
{
    public interface IRepository<T> where T : class
    {
        IQueryable<T> SelectRecordList();
        IQueryable<T> SelectRecordList( Expression<Func<T, bool>> whereCondition );
        T SelectRecord( int id );
        T SelectRecord( Expression<Func<T, bool>> whereCondition );
        //T Select( string name );
        void InsertOnSubmit( T entity );
        void DeleteOnSubmit( T entity );
        void Save( T entity );
        void SubmitChanges();
    }

    public interface IRepository
    {
        IQueryable SelectRecordList();
        object SelectRecord( int id );
        //object Select( string name );
        void InsertOnSubmit( object entity );
        void DeleteOnSubmit( object entity );
        void Save( object entity );
        void SubmitChanges();
    }
}
