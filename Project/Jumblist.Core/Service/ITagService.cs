using JumblistTest.Website.Model;
using System.Collections.Generic;

namespace JumblistTest.Website.Services
{
    public interface ITagService
    {
        IList<Tag> SelectList();
        Tag Select( int id );
        void Save( Tag entity );
        void Delete( Tag entity );
    }
}
