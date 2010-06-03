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

namespace StuartClode.Mvc.Service.Data
{
    public class DataService<T> : IDataService<T>, IDataService where T : class
    {
        private readonly IRepository<T> repository;

        public DataService( IRepository<T> repository )
        {
            this.repository = repository;
        }

        #region IDataService<T> Members

        public virtual DataContext DataContext
        {
            get { return repository.DataContext; }
        }

        public virtual IQueryable<T> SelectRecordList()
        {
            return repository.SelectRecordList();
        }

        public virtual IQueryable<T> SelectRecordList( Expression<Func<T, bool>> whereCondition )
        {
            return repository.SelectRecordList( whereCondition );
        }

        public virtual T SelectRecord( int id )
        {
            return repository.SelectRecord( id );
        }

        public virtual T SelectRecord( Expression<Func<T, bool>> whereCondition )
        {
            return repository.SelectRecord( whereCondition );
        }

        public virtual void Save( T entity )
        {
            if ( IsNew( entity ) )
            {
                repository.InsertOnSubmit( entity );
            }
            else
            {
                repository.Save( entity );
            }

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

        public virtual bool IsNew( T entity )
        {
            var primaryKeyProperty = typeof( T ).GetPrimaryKey();
            var primaryKeyValue = (int)primaryKeyProperty.GetValue( entity, null );

            return ( primaryKeyValue == 0 ) ? true : false;
        }

        public virtual bool IsDuplicate( Expression<Func<T, bool>> whereCondition )
        {
            return SelectRecordList( whereCondition ).Any();
        }

        public virtual bool IsDuplicate( IQueryable<T> list, Expression<Func<T, bool>> whereCondition )
        {
            return list.Where( whereCondition ).Any();
        }

        #endregion

        #region IDataService Members

        IQueryable IDataService.SelectRecordList()
        {
            return SelectRecordList();
        }

        object IDataService.SelectRecord( int id )
        {
            return SelectRecord( id );
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

        public void ValidateDataRules( object entity )
        {
            var errors = DataAnnotationsValidationRunner.GetErrors( entity );
            if ( errors.Any() )
                throw new RulesException( errors );
        }
    }
}
