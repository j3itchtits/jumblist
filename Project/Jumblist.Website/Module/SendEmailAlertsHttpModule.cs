using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using Jumblist.Core.Service;
using StuartClode.Mvc.Service.Data;
using Jumblist.Core.Model;
using Microsoft.Practices.ServiceLocation;
using StuartClode.Mvc.Service.Serialization;

namespace Jumblist.Website.Module
{
    public class SendEmailAlertsHttpModule : IHttpModule
    {
        protected static Timer _timer;
        private static object _lock = new object();
        protected static string _value;
        protected static bool _start = true;

        private IPostService postService = ServiceLocator.Current.GetInstance<IPostService>();
        private IDataService<UserAlert> userAlertService = ServiceLocator.Current.GetInstance<IDataService<UserAlert>>();
        private IMailService mailService = ServiceLocator.Current.GetInstance<IMailService>();

        protected void DoWork( object state )
        {
            lock ( _lock )
            {
                try
                {
                    SendImmediateEmailAlerts();
                    SendTimedEmailAlerts();
                }
                catch ( Exception ex )
                {
                    //need to throw an error that can be caught by Elmah - by default the error gets handled by the web server which then crashes
                    //throw ex;
                    return;
                }
            }
        }

        private void SendTimedEmailAlerts()
        {
            IEnumerable<UserAlert> alerts = userAlertService.SelectRecordList( x => x.IsActive == true && x.IsImmediateSend == false && x.TimetoSend == DateTime.Now.Hour && x.DateTimeLastSent.DayOfYear != DateTime.Now.DayOfYear );
            SendEmailAlerts( alerts );
        }

        private void SendImmediateEmailAlerts()
        {
            //First we need a list of all the active alerts
            IEnumerable<UserAlert> alerts = userAlertService.SelectRecordList( x => x.IsActive == true && x.IsImmediateSend == true );
            SendEmailAlerts( alerts );
        }

        private void SendEmailAlerts( IEnumerable<UserAlert> alerts )
        {
            //Now we need to loop through each alert pulling out the postlist and then filtering by comparing the alert.lastsenttime with the post.lastupdatedtime
            foreach ( UserAlert alert in alerts )
            {
                PostListRouteValues postListRouteValues = (PostListRouteValues)Serializer.Deserialize( alert.PostListRouteValues );
                UserSearchArea userSearchArea = (UserSearchArea)Serializer.Deserialize( alert.SearchArea );

                IEnumerable<Post> postList = postService.RecordList( postListRouteValues, userSearchArea );
                postList = postList.Where( x => x.LastUpdatedDateTime > alert.DateTimeLastSent );

                //We then loop though the postlist (if count > 0) for each alert and send out an email for each post
                if ( postList.Count() > 0 )
                {
                    mailService.SendEmailAlert( alert, postList );

                    //We then need to update each alert lastsenttime 
                    alert.DateTimeLastSent = DateTime.Now;
                    userAlertService.Save( alert );
                }
            }
        }

        #region IHttpModule Members

        public void Dispose()
        {

        }

        public void Init( HttpApplication context )
        {
            //There must only ever be 1 instance of Timer class
            if ( _timer == null && _start == true )
            {
                var timerCallback = new TimerCallback( DoWork );
                var startTime = 0;
                //1 second = 1000 ticks
                var tickDuration = 300000;
                _timer = new Timer( timerCallback, null, startTime, tickDuration );
            }
        }

        #endregion
    }
}
