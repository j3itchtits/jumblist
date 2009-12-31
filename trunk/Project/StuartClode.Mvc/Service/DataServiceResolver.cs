using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.MicroKernel;

namespace StuartClode.Mvc.Service
{
    public class DataServiceResolver : IDataServiceResolver
    {
        private readonly IKernel kernel;

        public DataServiceResolver( IKernel kernel )
        {
            this.kernel = kernel;
        }

        #region IDataServiceResolver Members

        public IDataService<T> GetDataService<T>() where T : class
        {
            Type dataServiceType = typeof( IDataService<> ).MakeGenericType( new[] { typeof( T ) } );

            var dataService = kernel.Resolve( dataServiceType ) as IDataService<T>;
            if (dataService == null)
                throw new ApplicationException( string.Format( "Could not find IDataService<{0}> in kernel", typeof( T ).Name ) );

            return dataService;
        }

        public IDataService GetDataService( Type type )
        {
            Type dataServiceType = typeof( IDataService<> ).MakeGenericType( new[] { type } );

            var dataService = kernel.Resolve( dataServiceType );
            
            if (dataService == null)
                throw new ApplicationException( string.Format( "Could not find IDataService<{0}> in kernel", type.Name ) );

            if ((dataService as IDataService) == null)
                throw new ApplicationException( string.Format( "The data service that implements IDataService<{0}> does not implement IDataService", type.Name ) );

            return dataService as IDataService;
        }

        #endregion
    }
}
