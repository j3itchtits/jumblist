using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Data
{
    public interface IPostService
    {
        IQueryable<Post> SelectList();
        IQueryable<Post> SelectPostsByLocation(int locationId);
        IQueryable<Post> SelectPostsByLocation(string locationName); 
        Post Select(int id);
        void Save( Post entity );
        void Delete( Post entity );
        bool IsDuplicate( IQueryable<Post> list, string id );
    }
}
