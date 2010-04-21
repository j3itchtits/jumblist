using System;
using System.Collections.Specialized;
using System.Reflection;
using System.Web.Mvc;
using StuartClode.Mvc.Repository;
using Jumblist.Website.ViewModel;
using StuartClode.Mvc.Extension;
using StuartClode.Mvc.Service.Data;

namespace Jumblist.Website.Controllers
{
    public class ViewModelController<T> : BaseController where T : class, new()
    {
        public IDataServiceResolver DataServiceResolver { get; set; }

        [NonAction]
        public virtual DefaultViewModel<T> BuildDefaultViewModel()
        {
            return DefaultView.CreateModel<T>();
        }

        [NonAction]
        public virtual DefaultViewModel<T> BuildDataEditDefaultViewModel()
        {
            var viewModel = DefaultView.CreateModel<T>();
            AddLookupListsToModel( viewModel );
            return viewModel;
        }

        [NonAction]
        public virtual PostViewModel<T> BuildPostViewModel()
        {
            return PostView.CreateModel<T>();
        }


        /// <summary>
        /// Appends any lookup lists T might need for editing
        /// </summary>
        /// <param name="viewData"></param>
        [NonAction]
        public virtual void AddLookupListsToModel( DefaultViewModel<T> viewModel )
        {
            // find any properties that are attributed as a linq entity
            foreach ( var property in typeof(T).GetProperties( BindingFlags.Public | BindingFlags.Instance ) )
            {
                if (property.PropertyType.IsLinqEntity())
                {
                    AppendLookupList( viewModel, property );
                }
            }
        }


        //Helper methods
        private void AppendLookupList( DefaultViewModel<T> viewModel, PropertyInfo property )
        {
            var dataService = DataServiceResolver.GetDataService( property.PropertyType );

            // get the items
            var list = dataService.SelectRecordList();

            // add the items to the viewData
            viewModel.WithLookupList( property.PropertyType, list );
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