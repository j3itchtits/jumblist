using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Routing;
using StuartClode.Mvc.Model;
using System.Web.Mvc;

namespace StuartClode.Mvc.Extension
{
    public static class PagingExtensions
    {
        #region HtmlHelper extensions

        public static MvcHtmlString PageSize( this HtmlHelper htmlHelper, int pageSize )
        {
            int[] pageSizeOptions = { 15, 30, 50 };
            StringBuilder s = new StringBuilder();
            UrlHelper urlHelper = ((Controller)htmlHelper.ViewContext.Controller).Url;

            foreach ( int p in pageSizeOptions )
            {
                if ( p == pageSize )
                {
                    s.Append( " <span class='bold'>" + p.ToString() + "</span> " );
                }
                else
                {
                    s.Append( " <a href='" + urlHelper.RouteUrl( htmlHelper.ViewContext.RouteData.Values ) + "?pagesize=" + p.ToString() + "' title='show " + p.ToString() + " items per page'>" + p.ToString() + "</a> " );
                }
            }

            return MvcHtmlString.Create( s.ToString() );
        }

        public static MvcHtmlString Pager( this HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount )
        {
            return Pager( htmlHelper, pageSize, currentPage, totalItemCount, null, null );
        }

        public static MvcHtmlString Pager( this HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount, string actionName )
        {
            return Pager( htmlHelper, pageSize, currentPage, totalItemCount, actionName, null );
        }

        public static MvcHtmlString Pager( this HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount, object values )
        {
            return Pager( htmlHelper, pageSize, currentPage, totalItemCount, null, new RouteValueDictionary( values ) );
        }

        public static MvcHtmlString Pager( this HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount, string actionName, object values )
        {
            return Pager( htmlHelper, pageSize, currentPage, totalItemCount, actionName, new RouteValueDictionary( values ) );
        }

        public static MvcHtmlString Pager( this HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount, RouteValueDictionary valuesDictionary )
        {
            return Pager( htmlHelper, pageSize, currentPage, totalItemCount, null, valuesDictionary );
        }

        public static MvcHtmlString Pager( this HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount, string actionName, RouteValueDictionary valuesDictionary )
        {
            if ( valuesDictionary == null )
            {
                valuesDictionary = new RouteValueDictionary();
            }

            if ( actionName != null )
            {
                if ( valuesDictionary.ContainsKey( "action" ) )
                {
                    throw new ArgumentException( "The valuesDictionary already contains an action.", "actionName" );
                }
                valuesDictionary.Add( "action", actionName );
            }
            
            var pager = new Pager( htmlHelper.ViewContext, pageSize, currentPage, totalItemCount, valuesDictionary );
            return MvcHtmlString.Create( pager.RenderHtml() );
        }

        public static MvcHtmlString PagingLinks( this HtmlHelper helper, int currentPage, int totalPages, Func<int, string> pageUrl )
        {
            StringBuilder result = new StringBuilder();
            for ( int i = 1; i <= totalPages; i++ )
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( i ).ToLower() );
                tag.InnerHtml = i.ToString();
                if ( i == currentPage )
                    tag.AddCssClass( "selected" );
                result.Append( tag.ToString() + " " );
            }
            return MvcHtmlString.Create( result.ToString() );
        }

        public static MvcHtmlString NextPreviousPageLinks( this HtmlHelper helper, int currentPage, bool hasPreviousPage, bool hasNextPage, Func<int, string> pageUrl )
        {
            string result = string.Empty;

            if ( hasPreviousPage )
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( currentPage - 1 ).ToLower() );
                tag.InnerHtml = "<";
                result += tag.ToString() + " ";
            }

            if ( hasNextPage )
            {
                TagBuilder tag = new TagBuilder( "a" );
                tag.MergeAttribute( "href", pageUrl( currentPage + 1 ).ToLower() );
                tag.InnerHtml = ">";
                result += tag.ToString() + " ";
            }

            return MvcHtmlString.Create( result );
        }

        #endregion

        #region IQueryable<T> extensions

        public static IPagedList<T> ToPagedList<T>( this IQueryable<T> source, int pageIndex, int pageSize )
        {
            return new PagedList<T>( source, pageIndex, pageSize );
        }

        public static IPagedList<T> ToPagedList<T>( this IQueryable<T> source, int pageIndex, int pageSize, int totalCount )
        {
            return new PagedList<T>( source, pageIndex, pageSize, totalCount );
        }

        #endregion

        #region IEnumerable<T> extensions

        public static IPagedList<T> ToPagedList<T>( this IEnumerable<T> source, int pageIndex, int pageSize )
        {
            return new PagedList<T>( source, pageIndex, pageSize );
        }

        public static IPagedList<T> ToPagedList<T>( this IEnumerable<T> source, int pageIndex, int pageSize, int totalCount )
        {
            return new PagedList<T>( source, pageIndex, pageSize, totalCount );
        }

        #endregion
    }
}
