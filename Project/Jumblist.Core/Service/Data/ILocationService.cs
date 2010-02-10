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
        void Delete( Location entity );
        string[] FindLocations(string q);
    }
}
