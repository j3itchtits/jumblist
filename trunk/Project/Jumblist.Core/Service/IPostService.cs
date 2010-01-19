using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public interface IPostService
    {
        IQueryable<Post> SelectList();
        Post Select( int id );
        void Save( Post entity );
        void Delete( Post entity );
        void ValidateBusinessRules( Post entity );
    }
}
