using System;
using System.Collections.Specialized;
using System.Reflection;
using System.Web.Mvc;
using StuartClode.Mvc.Repository;
using Jumblist.Website.ViewModel;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Service.Data;
using System.Collections.Generic;
using System.Linq;
using Jumblist.Core.Model;
using Jumblist.Website.Result;
using System.ServiceModel.Syndication;

namespace Jumblist.Website.Controllers
{
    public class ViewModelController<T> : BaseController where T : class, new()
    {
        public IDataServiceResolver DataServiceResolver { get; set; }

        [NonAction]
        protected internal virtual DefaultViewModel<T> BuildDefaultViewModel()
        {
            return DefaultView.CreateModel<T>();
        }

        [NonAction]
        protected internal virtual DefaultViewModel<T> BuildDataEditDefaultViewModel()
        {
            var viewModel = DefaultView.CreateModel<T>();
            AddSelectListsToModel( viewModel );
            return viewModel;
        }

        [NonAction]
        protected internal virtual PostViewModel BuildPostViewModel()
        {
            return PostView.CreateModel();
        }

        [NonAction]
        protected internal virtual RssResult Rss( SyndicationFeed feed )
        {
            return new RssResult() { Feed = feed };
        }

        /// <summary>
        /// Add all select lists available to T
        /// </summary>
        /// <param name="viewModel"></param>
        [NonAction]
        private void AddSelectListsToModel( DefaultViewModel<T> viewModel )
        {
            // find any properties that are attributed as a linq entity
            foreach ( var property in typeof(T).GetProperties( BindingFlags.Public | BindingFlags.Instance ) )
            {
                if (property.PropertyType.IsLinqEntity())
                {
                    // get the items
                    var dataService = DataServiceResolver.GetDataService( property.PropertyType );
                    var list = dataService.SelectRecordList();
                    // add the items to the viewData
                    viewModel.WithSelectList( property.PropertyType, list );
                }
            }
        }


    }


    public class ViewModelController : BaseController
    {
        [NonAction]
        public virtual DefaultViewModel BuildDefaultViewModel()
        {
            return DefaultView.CreateModel();
        }
    }
}