using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Entity;
using System.Net.Mail;

namespace Jumblist.Services
{
    public class EmailBasketSubmitter : IBasketSubmitter
    {
        private const string mailSubject = "New order submitted!";
        private string smtpServer;
        private string mailFrom;
        private string mailTo;

        public EmailBasketSubmitter( string smtpServer, string mailFrom, string mailTo )
        {
            // Receive parameters from IoC container
            this.smtpServer = smtpServer;
            this.mailFrom = mailFrom;
            this.mailTo = mailTo;
        }

        #region IBasketSubmitter Members

        public void SubmitBasket( Basket basket )
        {
            // Prepare the message body
            StringBuilder body = new StringBuilder();
            body.AppendLine( "A new order has been submitted" );
            body.AppendLine( "---" );
            body.AppendLine( "Items:" );
            foreach (var item in basket.Items)
            {
                body.AppendLine( item.Title );
            }
            body.AppendLine( "---" );
            body.AppendLine( "Ship to:" );
            body.AppendLine( basket.BasketUser.Name );
            body.AppendLine( basket.BasketUser.Email );
            body.AppendLine( basket.BasketUser.PostCode );
            body.AppendLine( "---" );

            // Dispatch the email
            SmtpClient smtpClient = new SmtpClient( smtpServer );
            smtpClient.Send( new MailMessage( mailFrom, mailTo, mailSubject, body.ToString() ) );
        }

        #endregion
    }
}
