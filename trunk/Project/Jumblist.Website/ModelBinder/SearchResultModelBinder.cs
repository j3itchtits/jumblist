using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Jumblist.Core.Model;
using System.Configuration;

namespace Jumblist.Website.ModelBinder
{
    public class SearchResultModelBinder : IModelBinder
    {
        private readonly string searchResultKey = ConfigurationManager.AppSettings["SearchResultModelBinderKey"];

        #region IModelBinder Members

        public object BindModel( ControllerContext controllerContext, ModelBindingContext bindingContext )
        {
            if ( controllerContext == null )
            {
                throw new ArgumentNullException( "controllerContext" );
            }

            if ( bindingContext == null )
            {
                throw new ArgumentNullException( "bindingContext" );
            }

            if ( bindingContext.Model != null )
            {
                throw new InvalidOperationException( "Cannot update instances" );
            }

            SearchResult searchResult = controllerContext.HttpContext.Session[searchResultKey] as SearchResult;

            if ( searchResult == null )
            {
                searchResult = new SearchResult();
                controllerContext.HttpContext.Session[searchResultKey] = searchResult;
            }

            return searchResult;
        }

        #endregion
    }
}
