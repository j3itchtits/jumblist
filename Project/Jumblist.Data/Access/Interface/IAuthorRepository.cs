using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Model;

namespace Jumblist.Data.Access
{
    public interface IAuthorRepository
    {
        //Query Lists
        IQueryable<Author> Authors { get; }
        IQueryable<Author> SelectAuthors();

        //Query Item
        Author SelectAuthor(int id);
        Author SelectAuthor(string name);

        // Insert/Delete
        void Add(Author author);
        void Delete(Author author);

        // Persistence
        void Save();


    }
}
