using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Data
{
    public interface ILocationService
    {
        IQueryable<Location> SelectList();
        Location Select( int id );
        Location Select(string name);
        void Save( Location entity );
        void Update(Location entity);
        void Delete( Location entity );
        string[] FindLocationNames(string q);
        string[] FindLocationAreas( string q );
        IEnumerable<Location> SelectLocationsByFeed( int feedId );
    }
}
