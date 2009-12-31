using JumblistTest.Website.Model;
using System.Collections.Generic;
using JumblistTest.Common.Repositories;
using System.Linq;

namespace JumblistTest.Website.Services
{
    public class PostService : IPostService
    {
        private readonly IRepository<Post> repository;

        public PostService( IRepository<Post> repository )
        {
            this.repository = repository;
        }

        #region IPostService Members


        public IList<Post> SelectList()
        {
            return repository.SelectList().ToList();
        }

        public Post Select( int id )
        {
            return repository.Select( id );
        }

        public void Save( Post entity )
        {
            if (entity.PostId == 0)
                repository.InsertOnSubmit( entity );
            else
                repository.Save( entity );

            repository.SubmitChanges();
        }

        public void Delete( Post entity )
        {
            repository.DeleteOnSubmit( entity );
            repository.SubmitChanges();
        }

        #endregion
    }
}
