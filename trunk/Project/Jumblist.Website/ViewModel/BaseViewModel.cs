using Jumblist.Core.Model;
using System.Collections.Generic;
using System.Web;
using Jumblist.Core.Service;
using System;
using System.Web.Mvc;
using System.Linq;

namespace Jumblist.Website.ViewModel
{
    public abstract class BaseViewModel : IBaseViewModel
    {
        public string PageTitle { get; set; }
        public string SimpleMessage { get; set; }
        public Message Message { get; set; }
        public List<Message> MessageList { get; set; }
        public User User { get; set; }
        public string ReturnUrl { get; set; }

        public BaseViewModel WithPageTitle( string pageTitle )
        {
            this.PageTitle = pageTitle;
            return this;
        }

        public BaseViewModel WithSimpleMessage( string simpleMessage )
        {
            this.SimpleMessage = simpleMessage;
            return this;
        }

        public BaseViewModel With( Message message )
        {
            this.Message = message;
            return this;
        }

        public BaseViewModel With( List<Message> messages )
        {
            this.MessageList = messages;
            return this;
        }

        public BaseViewModel With( User user )
        {
            this.User = user;
            return this;
        }

        public BaseViewModel WithReturnUrl( string returnUrl )
        {
            this.ReturnUrl = returnUrl;
            return this;
        }

        public SelectList BuildSelectList( IEnumerable<string> ienum )
        {
            return BuildSelectList( ienum, null );
        }

        public SelectList BuildSelectList( IEnumerable<string> ienum, object defaultValue )
        {
            IEnumerable<SelectListItem> items = ienum.Select( x => new SelectListItem() { Text = x, Value = x.ToLower() } );
            return new SelectList( items, "Value", "Text", defaultValue );
        }

        public SelectList BuildSelectList( IEnumerable<string[]> ienum, object defaultValue )
        {
            IEnumerable<SelectListItem> items = ienum.Select( x => new SelectListItem() { Text = x[1], Value = x[0].ToLower() } );
            return new SelectList( items, "Value", "Text", defaultValue );
        }

        public SelectList BuildSelectList( IDictionary<string, string> idic )
        {
            return BuildSelectList( idic, null );
        }

        public SelectList BuildSelectList( IDictionary<string, string> idic, object defaultValue )
        {
            IEnumerable<SelectListItem> items = idic.Select( x => new SelectListItem() { Text = x.Key, Value = x.Value.ToLower() } );
            return new SelectList( items, "Value", "Text", defaultValue );
        }

        public SelectList BuildHoursSelectList( object defaultValue )
        {
            IList<string> list = new List<string>();

            for ( int i = 0; i < 24; i++ )
            {
                list.Add( i.ToString() );
            }

            return BuildSelectList( list, defaultValue );
        }
    }
}
