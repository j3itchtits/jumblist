using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Model.Entity;

namespace Jumblist.Model.Abstract
{
    public interface IPostRepository
    {
        //Query Lists
        IQueryable<Post> SelectPosts();
        IQueryable<Post> SelectPostsByCategory( int postCategoryId );
        IQueryable<Post> SelectPostsByLocation(float latitude, float longitude, int distance);
        IQueryable<Post> SelectPostsByTag(string tagName);
        IQueryable<Post> SelectPostsByTagLocation(string tagName, float latitude, float longitude, int distance);

        //Query Item
        Post SelectPost(int id);

        // Insert/Delete
        void Add(Post post);
        void Delete(Post post);

        // Persistence
        void Save();
    }
}
