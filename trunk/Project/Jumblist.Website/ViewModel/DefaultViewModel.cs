using System;
using System.Collections;
using System.Collections.Generic;
using StuartClode.Mvc.Extension;
using System.Reflection;
using StuartClode.Mvc.Service.Data;

using StuartClode.Mvc.Model;

namespace Jumblist.Website.ViewModel
{
    public class DefaultViewModel<T> : ViewModelBase
    {
        private readonly Dictionary<Type, object> lookupLists = new Dictionary<Type, object>();

        public IEnumerable<T> List { get; set; }
        public T Item { get; set; }
        public PaginatedList<T> PaginatedList { get; set; }
        public int ListCount { get; set; }
        public string EntityName { get { return typeof( T ).Name; } }

        public DefaultViewModel<T> With( T item )
        {
            Item = item;
            return this;
        }

        public DefaultViewModel<T> With( IEnumerable<T> list )
        {
            List = list;
            return this;
        }

        public DefaultViewModel<T> With( PaginatedList<T> list )
        {
            PaginatedList = list;
            return this;
        }

        public DefaultViewModel<T> WithLookupList( Type entityType, object items )
        {
            lookupLists.Add( entityType, items );
            return this;
        }

        public DefaultViewModel<T> WithListCount( int number )
        {
            this.ListCount = number;
            return this;
        }

		public IEnumerable<TLookup> LookupList<TLookup>()
		{
            return GetLookupList( typeof( TLookup ) ) as IEnumerable<TLookup>;
		}

        private IEnumerable GetLookupList( Type lookupType )
        {
            if ( !lookupLists.ContainsKey( lookupType ) )
                throw new ApplicationException( string.Format( "List of type {0} does not exist in lookup list", lookupType.Name ) );

            return lookupLists[lookupType] as IEnumerable;
        }
    }

    public static class DefaultView
    {
        public static DefaultViewModel<T> Model<T>()
        {
            return new DefaultViewModel<T>();
        }

    }
}
