﻿using System;
using System.Linq;
using System.Data.Linq;
using System.Linq.Expressions;

namespace StuartClode.Mvc.Repository
{
    public interface IRepository<T> where T : class
    {
        T Select( int id );
        T Select( string name );
        IQueryable<T> SelectList();
        IQueryable<T> SelectList(Expression<Func<T, bool>> whereCondition);
        void InsertOnSubmit( T entity );
        void DeleteOnSubmit( T entity );
        void Save( T entity );
        void SubmitChanges();
    }

    public interface IRepository
    {
        object Select( int id );
        object Select( string name );
        IQueryable SelectList();
        void InsertOnSubmit( object entity );
        void DeleteOnSubmit( object entity );
        void Save( object entity );
        void SubmitChanges();
    }
}
