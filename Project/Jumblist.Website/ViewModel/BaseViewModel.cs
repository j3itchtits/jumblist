using Jumblist.Core.Model;
using System.Collections.Generic;
using System.Web;
using Jumblist.Core.Service.Data;

namespace Jumblist.Website.ViewModel
{
    public abstract class BaseViewModel : IBaseViewModel
    {
        public string PageTitle { get; set; }
        public string SimpleMessage { get; set; }
        public Message Message { get; set; }
        public List<Message> MessageList { get; set; }
        public User User { get; set; }

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

        public BaseViewModel WithMessage( Message message )
        {
            this.Message = message;
            return this;
        }

        public BaseViewModel WithMessageList( List<Message> messages )
        {
            this.MessageList = messages;
            return this;
        }

        public BaseViewModel WithUser( User user )
        {
            this.User = user;
            return this;
        }
    }
}
