using JumblistTest.Website.Model;
using System.Collections.Generic;

namespace JumblistTest.Website.Services
{
    public interface IPostService
    {
        IList<Post> SelectList();
        Post Select( int id );
        void Save( Post entity );
        void Delete( Post entity );
    }
}
