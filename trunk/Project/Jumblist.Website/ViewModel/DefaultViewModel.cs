using System;
using System.Collections;
using System.Collections.Generic;
using StuartClode.Mvc.Extension;
using System.Reflection;
using StuartClode.Mvc.Service;

namespace JumblistTest.Website.ViewModel
{
    public class DefaultViewModel<T> : ViewModelBase
    {
        private readonly Dictionary<Type, object> lookupLists = new Dictionary<Type, object>();

        public IEnumerable<T> Items { get; set; }
        public T Item { get; set; }

        public DefaultViewModel<T> With( T item )
        {
            Item = item;
            return this;
        }

        public DefaultViewModel<T> With( IEnumerable<T> items )
        {
            Items = items;
            return this;
        }

        public DefaultViewModel<T> WithLookupList( Type entityType, object items )
        {
            lookupLists.Add( entityType, items );
            return this;
        }

		public IEnumerable<TLookup> LookupList<TLookup>()
		{
            return GetLookupList( typeof( TLookup ) ) as IEnumerable<TLookup>;
		}

        private IEnumerable GetLookupList( Type lookupType )
        {
            if ( !lookupLists.ContainsKey( lookupType ) )
            {
                throw new ApplicationException( string.Format( "List of type {0} does not exist in lookup list", lookupType.Name ) );
            }
            return lookupLists[lookupType] as IEnumerable;
        }

        public string EntityName
        {
            get
            {
                return typeof(T).Name;                
            }
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
