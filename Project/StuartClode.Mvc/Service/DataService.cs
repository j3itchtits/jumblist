using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StuartClode.Mvc.Repository;
using StuartClode.Mvc.Extension;
using System.Linq.Expressions;
using System.Collections;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using xVal.ServerSide;

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

        public virtual void Save( T entity )
        {
            //Data Validation
            var errors = GetErrors( entity );
            if (errors.Any())
                throw new RulesException( errors );

            var primaryKeyProperty = typeof( T ).GetPrimaryKey();
            var primaryKeyValue = (int)primaryKeyProperty.GetValue( entity, null );

            if (primaryKeyValue == 0)
                repository.InsertOnSubmit( entity );
            else
                repository.Save( entity );

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

        public void Save( object entity )
        {
            Save( entity );
        }

        public void Delete( object entity )
        {
            Delete( entity );
        }

        #endregion

        private IEnumerable<ErrorInfo> GetErrors( object instance )
        {
            return from prop in TypeDescriptor.GetProperties( instance ).Cast<PropertyDescriptor>()
                   from attribute in prop.Attributes.OfType<ValidationAttribute>()
                   where !attribute.IsValid( prop.GetValue( instance ) )
                   select new ErrorInfo( prop.Name, attribute.FormatErrorMessage( string.Empty ), instance );
        }
    }
}
