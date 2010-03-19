using Jumblist.Core.Model;
using System.Collections.Generic;
using System.Web;
using Jumblist.Core.Service.Data;

namespace Jumblist.Website.ViewModel
{
    public abstract class ViewModelBase : IViewModelBase
    {
        public string PageTitle { get; set; }
        public string SimpleMessage { get; set; }
        public Message Message { get; set; }
        public List<Message> MessageList { get; set; }
        
        public ViewModelBase WithPageTitle( string pageTitle )
        {
            this.PageTitle = pageTitle;
            return this;
        }

        public ViewModelBase WithSimpleMessage( string simpleMessage )
        {
            this.SimpleMessage = simpleMessage;
            return this;
        }

        public ViewModelBase WithMessage( Message message )
        {
            this.Message = message;
            return this;
        }

        public ViewModelBase WithMessageList( List<Message> messages )
        {
            this.MessageList = messages;
            return this;
        }

    }
}
