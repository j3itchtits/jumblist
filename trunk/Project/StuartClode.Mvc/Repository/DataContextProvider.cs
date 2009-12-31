using System.Data.Linq;

namespace StuartClode.Mvc.Repository
{
    public class DataContextProvider : IDataContextProvider
    {
        private readonly DataContext dataContext;


        public DataContextProvider( IConnectionStringProvider connectionStringProvider )
        {
            dataContext = new DataContext( connectionStringProvider.ConnectionString );
        }


        public DataContext DataContext
        {
            get
            {
                return dataContext;
            }
        }

        public void Dispose()
        {
            dataContext.Dispose();
        }
    }
}
