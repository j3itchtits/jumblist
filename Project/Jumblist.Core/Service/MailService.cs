using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Core.Model;
using System.IO;
using System.Collections;
using System.Net.Mail;
using System.Configuration;
using Castle.Components.Common.TemplateEngine;
using Castle.Components.Common.TemplateEngine.NVelocityTemplateEngine;
using System.ComponentModel;

namespace Jumblist.Core.Service
{
    public class MailService
    {
        public ITemplateEngine engine;
        string templatesPath = Path.Combine( AppDomain.CurrentDomain.BaseDirectory, "Templates" );

        public MailService()
        {
            engine = new NVelocityTemplateEngine( templatesPath );
            ( engine as ISupportInitialize ).BeginInit();
        }

        public void SendRegistrationVerificationEmail( User user )
        {
            string emailBody;
            using ( StringWriter writer = new StringWriter() )
            {
                IDictionary context = new Hashtable();
                context.Add( "user", user );

                engine.Process( context, "RegistrationVerification.vm", writer );

                emailBody = writer.ToString();
            }

            const string mailSubject = "Verification Mail";

            MailMessage message = new MailMessage( ConfigurationManager.AppSettings["DefaultEmail"], user.Email, mailSubject, emailBody );
            message.BodyEncoding = Encoding.Default;
            message.IsBodyHtml = true;

            SmtpClient smtpClient = new SmtpClient();

            smtpClient.Send( message );
        }
    }
}
