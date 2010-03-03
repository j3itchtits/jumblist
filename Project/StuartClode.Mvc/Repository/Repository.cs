using System;
using System.Linq;
using System.Linq.Expressions;
using System.Data.Linq;
using System.Runtime.Serialization;
using StuartClode.Mvc.Extension;

namespace StuartClode.Mvc.Repository
{
    public class Repository<T> : IRepository<T>, IRepository where T : class
    {
        private readonly DataContext dataContext;
        private readonly ITable table;

        public Repository( IDataContextProvider dataContextProvider )
        {
            dataContext = dataContextProvider.DataContext;
            table = dataContext.GetTable<T>();
        }

        #region IRepository<T> Members

        public virtual IQueryable<T> SelectRecordList()
        {
            return dataContext.GetTable<T>();
        }

        public virtual IQueryable<T> SelectRecordList( Expression<Func<T, bool>> whereCondition )
        {
            return dataContext.GetTable<T>().Where( whereCondition );
        }

        public virtual T SelectRecord( int id )
        {
            var entityParameter = Expression.Parameter( typeof( T ), "entity" );

            var whereCondition = 
                Expression.Lambda<Func<T, bool>> (
                    Expression.Equal( Expression.Property( entityParameter, typeof( T ).GetPrimaryKey().Name ), Expression.Constant( id ) ),
                    new[] { entityParameter }
                );

            var item = dataContext.GetTable<T>().SingleOrDefault( whereCondition );

            if ( item == null )
                throw new PrimaryKeyNotFoundException( string.Format( "No {0} with primary key {1} found", typeof( T ).FullName, id ) );

            return item;
        }

        public virtual T SelectRecord( Expression<Func<T, bool>> whereCondition )
        {
            return dataContext.GetTable<T>().SingleOrDefault( whereCondition );
        }

        //public virtual T Select( string name )
        //{
        //    var entityParameter = Expression.Parameter( typeof( T ), "entity" );
        //    var nameProperty = typeof( T ).GetProperty( "Name" ).Name;

        //    if (nameProperty == null)
        //        throw new ApplicationException( string.Format( "This type {0} does not have a name property", typeof( T ).FullName ) );

        //    var whereExpression =
        //        Expression.Lambda<Func<T, bool>>(
        //            Expression.Equal( Expression.Property( entityParameter, nameProperty ), Expression.Constant( name ) ),
        //            new[] { entityParameter }
        //        );

        //    var item = SelectList().SingleOrDefault( whereExpression );

        //    //if (item == null)
        //    //    throw new ArgumentException(string.Format("No name property with value {0} found", name));

        //    return item;
        //}

        public virtual void InsertOnSubmit( T entity )
        {
            table.InsertOnSubmit( entity );
        }

        public virtual void DeleteOnSubmit( T entity )
        {
            table.DeleteOnSubmit( entity );
        }

        public virtual void Save( T entity )
        {
            table.Attach( entity );
            table.Context.Refresh( RefreshMode.KeepCurrentValues, entity );
        }

        public virtual void SubmitChanges()
        {
            table.Context.SubmitChanges();
        }



        #endregion

        #region IRepository Members

        IQueryable IRepository.SelectRecordList()
        {
            return SelectRecordList();
        }

        object IRepository.SelectRecord( int id )
        {
            return SelectRecord( id );
        }

        //object IRepository.Select( string name )
        //{
        //    return Select( name );
        //}

        public void InsertOnSubmit( object entity )
        {
            InsertOnSubmit( (T)entity );
        }

        public void DeleteOnSubmit( object entity )
        {
            DeleteOnSubmit( (T)entity );
        }

        public void Save( object entity )
        {
            Save( (T)entity );
        }

        #endregion
    }

    [Serializable]
    public class PrimaryKeyNotFoundException : Exception
    {
        //
        // For guidelines regarding the creation of new exception types, see
        //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconerrorraisinghandlingguidelines.asp
        // and
        //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dncscol/html/csharp07192001.asp
        //

        public PrimaryKeyNotFoundException()
        {
        }

        public PrimaryKeyNotFoundException( string message )
            : base( message )
        {
        }

        public PrimaryKeyNotFoundException( string message, Exception inner )
            : base( message, inner )
        {
        }

        protected PrimaryKeyNotFoundException(
            SerializationInfo info,
            StreamingContext context )
            : base( info, context )
        {
        }
    }
}
