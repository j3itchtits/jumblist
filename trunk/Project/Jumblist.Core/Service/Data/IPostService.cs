using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Data
{
    public interface IPostService
    {
        IQueryable<Post> SelectList();
        IQueryable<Post> SelectActiveList();
        Post Select(int id);
        void Save( Post entity );
        void Delete( Post entity );
        IEnumerable<Post> SelectPostsByLocation(int locationId);
        IEnumerable<Post> SelectPostsByLocation(string locationName);
        IEnumerable<Post> SelectPostsByTag(int tagId);
        IEnumerable<Post> SelectPostsByTag(string tagName); 
        bool IsDuplicate(IQueryable<Post> list, string id);
    }
}
