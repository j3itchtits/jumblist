using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Core.Model
{
    public class Notification
    {
        private List<NotificationMessage> _list = new List<NotificationMessage>();

        public bool IsValid()
        {
            return _list.Count > 0;
        }

        public void RegisterMessage( string messageText, string styleClass )
        {
            _list.Add( new NotificationMessage { Text = messageText, StyleClass = styleClass } );
        }

        public string[] GetMessages( string messageText )
        {
            List<NotificationMessage> messages = _list.Where<NotificationMessage>( m => m.Text == messageText ).ToList();

            string[] returnValue = new string[messages.Count];
            for ( int i = 0; i < messages.Count; i++ )
            {
                returnValue[i] = messages[i].Text;
            }

            return returnValue;
        }

        public NotificationMessage[] AllMessages()
        {
            return _list.ToArray();
        }

        public bool HasMessage( string messageText, string styleClass )
        {
            NotificationMessage message = new NotificationMessage { Text = messageText, StyleClass = styleClass };
            return _list.Contains( message );
        }
    }
}
