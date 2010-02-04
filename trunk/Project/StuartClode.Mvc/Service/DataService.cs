using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using System.Linq.Expressions;
using System.Collections;
using StuartClode.Mvc.Validation;
using xVal.ServerSide;
using System.Data.Linq;

namespace StuartClode.Mvc.Service
{
    public class DataService<T> : IDataService<T>, IDataService where T : class
    {
        private readonly IRepository<T> repository;

        public DataService( IRepository<T> repository )
        {
            this.repository = repository;
        }

        #region IDataService<T> Members

        public virtual IQueryable<T> SelectList()
        {
            return repository.SelectList();
        }

        public virtual T Select( int id )
        {
            return repository.Select( id );
        }

        public virtual T Select( string name )
        {
            return repository.Select( name );
        }

        public virtual void Save( T entity )
        {
            var primaryKeyProperty = typeof( T ).GetPrimaryKey();
            var primaryKeyValue = (int)primaryKeyProperty.GetValue( entity, null );

            if (primaryKeyValue == 0)
                repository.InsertOnSubmit( entity );
            else
                repository.Save( entity );

            repository.SubmitChanges();
        }

        public virtual void Update( T entity )
        {
            repository.SubmitChanges();
        }

        public virtual void Delete( T entity )
        {
            repository.DeleteOnSubmit( entity );
            repository.SubmitChanges();
        }

        #endregion

        #region IDataService Members

        IQueryable IDataService.SelectList()
        {
            return SelectList();
        }

        object IDataService.Select( int id )
        {
            return Select( id );
        }

        object IDataService.Select( string name )
        {
            return Select( name );
        }

        public void Save( object entity )
        {
            Save( entity );
        }

        public void Update( object entity )
        {
            Update( entity );
        }

        public void Delete( object entity )
        {
            Delete( entity );
        }

        #endregion

    }
}
