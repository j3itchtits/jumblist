using System;

namespace StuartClode.Mvc.Service
{
    public interface IDataServiceResolver
    {
        IDataService<T> GetDataService<T>() where T : class;
        IDataService GetDataService( Type type );
    }
}