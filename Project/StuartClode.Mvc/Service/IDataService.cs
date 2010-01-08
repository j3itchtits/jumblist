using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace StuartClode.Mvc.Service
{
    public interface IDataService<T> where T : class
    {
        IQueryable<T> SelectList();
        T Select( int id );
        void Save( T entity );
        void Update( T entity );
        void Delete( T entity );
    }

    public interface IDataService
    {
        IQueryable SelectList();
        object Select( int id );
        void Save( object entity );
        void Update( object entity );
        void Delete( object entity );
    }
}
