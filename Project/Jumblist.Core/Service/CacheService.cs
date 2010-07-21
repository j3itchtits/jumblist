using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Jumblist.Core.Service
{
    public class CacheService : ICacheService
    {
        public T Get<T>( string cacheID, Func<T> getItemCallback ) where T : class
        {
            T item = HttpRuntime.Cache.Get( cacheID ) as T;
            if ( item == null )
            {
                item = getItemCallback();
                HttpContext.Current.Cache.Insert( cacheID, item );
            }
            return item;
        }
    }
}
