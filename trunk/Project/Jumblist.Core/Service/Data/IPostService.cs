using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Data
{
    public interface IPostService
    {
        IQueryable<Post> SelectList();
        IQueryable<Post> SelectList( bool isActive );
        Post Select(int id);
        void Save( Post entity );
        void Update( Post entity );
        void Delete( Post entity );
        IEnumerable<Post> SelectPostsByLocation(int locationId);
        IEnumerable<Post> SelectPostsByLocation( int locationId, bool isActive );
        IEnumerable<Post> SelectPostsByLocation(string locationName);
        IEnumerable<Post> SelectPostsByLocation( string locationName, bool isActive );
        IEnumerable<Post> SelectPostsByTag(int tagId);
        IEnumerable<Post> SelectPostsByTag( int tagId, bool isActive );
        IEnumerable<Post> SelectPostsByTag(string tagName);
        IEnumerable<Post> SelectPostsByTag( string tagName, bool isActive );
        IEnumerable<Post> SelectPostsByTag( Tag tag );
        IEnumerable<Post> SelectPostsByTag( Tag tag, bool isActive );
        IEnumerable<Post> SelectPostsByTag( IQueryable<Tag> tagList );
        IEnumerable<Post> SelectPostsByTag( IQueryable<Tag> tagList, bool isActive ); 
        IEnumerable<Post> SelectPostsByCategory( int categoryId );
        IEnumerable<Post> SelectPostsByCategory( int categoryId, bool isActive );
        IEnumerable<Post> SelectPostsByCategory( string categoryName );
        IEnumerable<Post> SelectPostsByCategory( string categoryName, bool isActive );
        IEnumerable<Post> SelectPostsByFeed( int feedId );
        IEnumerable<Post> SelectPostsByFeed( int feedId, bool isActive );
        IEnumerable<Post> SelectPostsByFeed( string feedName );
        IEnumerable<Post> SelectPostsByFeed( string feedName, bool isActive );
        bool IsDuplicate( IQueryable<Post> list, string guid );
    }
}
