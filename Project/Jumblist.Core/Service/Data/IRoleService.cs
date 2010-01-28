using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Data
{
    public interface IRoleService
    {
        IQueryable<Role> SelectList();
        Role Select( int id );
        void Save( Role entity );
        void Delete( Role entity );
    }
}
