using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public class EmailBasketSubmitter : IBasketSubmitter
    {
        private const string mailSubject = "New order submitted!";
        //private const string smtpServer = "lonex01";
        //private const string smtpServer = "XCZC01060F5";
        private const string smtpServer = "localhost";
        private const string mailFrom = "jumblist@jumblist.co.uk";
        
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
            SmtpClient smtpClient = new SmtpClient( smtpServer );
            smtpClient.Send( new MailMessage( mailFrom, user.Email, mailSubject, body.ToString() ) );
        }

        #endregion
    }
}
