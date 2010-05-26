using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using Jumblist.Core.Model;
using System.Configuration;

namespace Jumblist.Core.Service
{
    public class EmailBasketSubmitter : IBasketSubmitter
    {
        const string mailSubject = "Jumblist post";
        //const string smtpServer = "localhost";
        private readonly string defaultEmail = ConfigurationManager.AppSettings["DefaultEmail"];
        
        #region IBasketSubmitter Members

        public void SubmitBasket( User user )
        {
            // Prepare the message body
            StringBuilder body = new StringBuilder();
            body.AppendLine( "A new order has been submitted" );
            body.AppendLine( "---" );
            body.AppendLine( "Items:" );
            foreach ( var item in user.Session.Basket.Items )
            {
                body.AppendLine( item.Title );
            }
            body.AppendLine( "---" );
            body.AppendLine( "Ship to:" );
            body.AppendLine( user.Name );
            body.AppendLine( user.Email );
            body.AppendLine( user.Postcode );
            body.AppendLine( "---" );

            // Dispatch the email
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Send( new MailMessage( defaultEmail, user.Email, mailSubject, body.ToString() ) );
        }

        #endregion
    }
}
