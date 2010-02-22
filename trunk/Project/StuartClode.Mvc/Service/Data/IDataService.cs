using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data.Linq;

namespace StuartClode.Mvc.Service.Data
{
    public interface IDataService<T> where T : class
    {
        IQueryable<T> SelectList();
        T Select( int id );
        T Select( string name );
        void Save( T entity );
        void Update( T entity );
        void Delete( T entity );
    }

    public interface IDataService
    {
        IQueryable SelectList();
        object Select( int id );
        object Select( string name );
        void Save( object entity );
        void Update( object entity );
        void Delete( object entity );
    }
}
