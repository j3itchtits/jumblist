﻿using System;
using System.Linq;
using System.Data.Linq;

namespace StuartClode.Mvc.Repository
{
    public interface IRepository<T> where T : class
    {
        T Select( int id );
        IQueryable<T> SelectList();
        void InsertOnSubmit( T entity );
        void DeleteOnSubmit( T entity );
        void Save( T entity );
        void SubmitChanges();
    }

    public interface IRepository
    {
        object Select( int id );
        IQueryable SelectList();
        void InsertOnSubmit( object entity );
        void DeleteOnSubmit( object entity );
        void Save( object entity );
        void SubmitChanges();
    }
}