using System;

namespace StuartClode.Mvc.Repository
{
    public interface IRepositoryResolver
    {
        IRepository<T> GetRepository<T>() where T : class;
        IRepository GetRepository(Type type);
    }
}