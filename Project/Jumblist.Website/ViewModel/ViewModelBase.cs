using Jumblist.Core.Model;

namespace Jumblist.Website.ViewModel
{
    public abstract class ViewModelBase : IViewModelBase
    {
        public string PageTitle { get; set; }
        public NotificationMessage NotificationMessage { get; set; }
        public Notification Notification { get; set; }
        public string SimpleMessage { get; set; }

        public ViewModelBase WithPageTitle( string pageTitle )
        {
            this.PageTitle = pageTitle;
            return this;
        }

        public ViewModelBase WithNotificationMessage( NotificationMessage notificationMessage )
        {
            this.NotificationMessage = notificationMessage;
            return this;
        }

        public ViewModelBase WithNotification( Notification notification )
        {
            this.Notification = notification;
            return this;
        }

        public ViewModelBase WithSimpleMessage( string simpleMessage )
        {
            this.SimpleMessage = simpleMessage;
            return this;
        }
    }
}
