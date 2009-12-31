using System;
using Castle.MicroKernel;
using StuartClode.Mvc.Extension;

namespace StuartClode.Mvc.Repository
{
    public class RepositoryResolver : IRepositoryResolver
    {
        private readonly IKernel kernel;

        public RepositoryResolver(IKernel kernel)
        {
            this.kernel = kernel;
        }

        public IRepository<T> GetRepository<T>() where T : class 
        {
            Type repositoryType = typeof(IRepository<>).MakeGenericType(new[] { typeof(T) });

            var repository = kernel.Resolve(repositoryType) as IRepository<T>;
            if (repository == null)
            {
                throw new ApplicationException(string.Format("Could not find IRepository<{0}> in kernel", typeof(T).Name));
            }
            return repository;
        }

        public IRepository GetRepository(Type type)
        {
            Type repositoryType = typeof(IRepository<>).MakeGenericType(new[] { type });

            var repository = kernel.Resolve(repositoryType);
            
            if (repository == null)
            {
                throw new ApplicationException( string.Format( "Could not find IRepository<{0}> in kernel", type.Name) );
            }

            if ((repository as IRepository) == null)
            {
                throw new ApplicationException( string.Format( "The repository that implements IRepository<{0}> does not implement IRepository", type.Name ) );
            }

            return (IRepository)repository;
        }
    }
}