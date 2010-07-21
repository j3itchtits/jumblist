using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Core.Service
{
    public interface ICacheService
    {
        T Get<T>( string cacheID, Func<T> getItemCallback ) where T : class;
    }
}
