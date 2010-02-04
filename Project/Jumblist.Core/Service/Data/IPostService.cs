using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Data
{
    public interface IPostService
    {
        IQueryable<Post> SelectList();
        IEnumerable<Post> SelectPostsByLocation( int locationId );
        IEnumerable<Post> SelectPostsByLocation( string locationName );
        IEnumerable<Post> SelectPostsByTag( int tagId );
        IEnumerable<Post> SelectPostsByTag( string tagName ); 
        Post Select(int id);
        void Save( Post entity );
        void Delete( Post entity );
        bool IsDuplicate( IQueryable<Post> list, string id );
    }
}
