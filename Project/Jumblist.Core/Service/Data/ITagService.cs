using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Data
{
    public interface ITagService
    {
        IQueryable<Tag> SelectList();
        Tag Select( int id );
        Tag Select(string name);
        void Save( Tag entity );
        void Delete( Tag entity );
        string[] FindTags(string q);
    }
}
