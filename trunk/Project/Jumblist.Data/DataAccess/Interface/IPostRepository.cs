using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Model;

namespace Jumblist.Data.DataAccess.Interface
{
    public interface IPostRepository
    {
        //Query Lists
        IQueryable<Post> Posts { get; }
        IQueryable<Post> SelectPosts();
        IQueryable<Post> SelectPostsByCategory( int categoryId );
        IQueryable<Post> SelectPostsByLocation( float latitude, float longitude, int distance );
        IQueryable<Post> SelectPostsByLocation( string locationName );
        IQueryable<Post> SelectPostsByTag( string tagName );
        IQueryable<Post> SelectPostsByAuthor( string authorName );
        IQueryable<Post> SelectPostsByFeed( string feedTitle );
        IQueryable<Post> SelectPostsByTagLocation( string tagName, float latitude, float longitude, int distance );

        //Query Item
        Post SelectPost( int id );
        Post SelectPost( string name );

        // Insert/Delete
        void Add( Post post );
        void Delete( Post post );

        // Persistence
        void Save();

        
    }
}
