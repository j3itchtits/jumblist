using Jumblist.Core.Model;
using System.Collections.Generic;
using System.Linq;

namespace Jumblist.Core.Service
{
    public interface IFeedService
    {
        IQueryable<Feed> SelectList();
        Feed Select( int id );
        void Save( Feed entity );
        void Delete( Feed entity );
        void ValidateBusinessRules( Feed entity );
    }
}
