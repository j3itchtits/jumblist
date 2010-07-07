using System;
using System.Collections;
using System.Collections.Generic;
using StuartClode.Mvc.Extension;
using System.Reflection;
using StuartClode.Mvc.Service.Data;
using StuartClode.Mvc.Model;
using System.ServiceModel.Syndication;
using Jumblist.Core.Model;

namespace Jumblist.Website.ViewModel
{
    public class DefaultViewModel<T> : BaseViewModel
    {
        private readonly Dictionary<Type, object> selectLists = new Dictionary<Type, object>();

        public IEnumerable<T> List { get; set; }
        public T Item { get; set; }
        public int ListCount { get; set; }
        public string EntityName { get { return typeof( T ).Name; } }
        public IPagedList<T> PagedList { get; set; }
        public PostListRouteValues PostListRouteValues { get; set; }
        public UserSearchArea UserSearchArea { get; set; }

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

        public DefaultViewModel<T> With( IPagedList<T> list )
        {
            PagedList = list;
            return this;
        }

        public DefaultViewModel<T> WithSelectList( Type entityType, object items )
        {
            selectLists.Add( entityType, items );
            return this;
        }

        public DefaultViewModel<T> WithListCount( int number )
        {
            this.ListCount = number;
            return this;
        }

        public DefaultViewModel<T> With( PostListRouteValues postListRouteValues )
        {
            this.PostListRouteValues = postListRouteValues;
            return this;
        }

        public DefaultViewModel<T> With( UserSearchArea userSearchArea )
        {
            this.UserSearchArea = userSearchArea;
            return this;
        }

        //This method is called from a view
        public IEnumerable<TLookup> SelectList<TLookup>()
        {
            Type lookupType = typeof( TLookup );

            if ( !selectLists.ContainsKey( lookupType ) )
                throw new ApplicationException( string.Format( "List of type {0} does not exist in lookup list", lookupType.Name ) );

            return selectLists[lookupType] as IEnumerable<TLookup>;
        }
    }


    public class DefaultViewModel : BaseViewModel
    {
        public SyndicationFeed Feed { get; set; }
        public string HttpResponse { get; set; }
        public Basket Basket { get; set; }

        public DefaultViewModel With( SyndicationFeed feed )
        {
            Feed = feed;
            return this;
        }

        public DefaultViewModel With( string httpResponse )
        {
            HttpResponse = httpResponse;
            return this;
        }

        public DefaultViewModel With( Basket basket )
        {
            Basket = basket;
            return this;
        }
    }

    public class DefaultView
    {
        public static DefaultViewModel<T> CreateModel<T>()
        {
            return new DefaultViewModel<T>();
        }

        public static DefaultViewModel CreateModel()
        {
            return new DefaultViewModel();
        }
    }
}
