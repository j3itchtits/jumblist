using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Data
{
    public interface ITagService
    {
        IQueryable<Tag> SelectList();
        Tag Select( int id );
        void Save( Tag entity );
        void Delete( Tag entity );
    }
}
