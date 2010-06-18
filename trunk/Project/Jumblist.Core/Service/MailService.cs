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
using System.Web;
using StuartClode.Mvc.Extension;

namespace Jumblist.Core.Service
{
    public class MailService : IMailService
    {
        ITemplateEngine engine;
        string templatesPath = Path.Combine( AppDomain.CurrentDomain.BaseDirectory, "Templates" );

        #region IPostService Members

        public void SendRegistrationVerificationEmail( User user )
        {
            string emailSubject = "Verification Mail";

            string encryptedId = user.UserId.ToString().EncryptString();
            string encryptedUrlEncodedId = HttpUtility.UrlEncode( encryptedId );
            string urlEncodedEmail = HttpUtility.UrlEncode( user.Email );
            string linkBack = ConfigurationManager.AppSettings["DefaultUrl"] + "/users/verifyregistration?userid=" + encryptedUrlEncodedId + "&useremail=" + urlEncodedEmail;

            IDictionary tokens = new Hashtable();
            tokens.Add( "user", user );
            tokens.Add( "linkBack", linkBack );

            string emailBody = GenerateEmailText( tokens, "RegistrationVerificationEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody );
        }

        public void SendPostEmail( Post post, User user )
        {
            string emailSubject = "Post Mail";

            IDictionary tokens = new Hashtable();
            tokens.Add( "post", post );
            tokens.Add( "postdate", post.PublishDateTime.ToLongDateString() );

            string emailBody = GenerateEmailText( tokens, "PostEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody );
        }

        public void SendBasketEmail( User user )
        {
            string emailSubject = "Basket Mail";

            IDictionary tokens = new Hashtable();
            tokens.Add( "user", user );

            string emailBody = GenerateEmailText( tokens, "BasketEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody );
        }

        public void SendForgottenPasswordEmail( User user )
        {
            string emailSubject = "Forgotten Password";

            string encryptedId = user.UserId.ToString().EncryptString();
            string encryptedUrlEncodedId = HttpUtility.UrlEncode( encryptedId );
            string linkBack = ConfigurationManager.AppSettings["DefaultUrl"] + "/users/passwordreset?reset=" + encryptedUrlEncodedId;

            IDictionary tokens = new Hashtable();
            tokens.Add( "user", user );
            tokens.Add( "linkBack", linkBack );

            string emailBody = GenerateEmailText( tokens, "ForgottenPasswordEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody );
        }


        public void SendPasswordResetEmail( User user, string password )
        {
            string emailSubject = "Your new password";

            string linkBack = ConfigurationManager.AppSettings["DefaultUrl"] + "/users/login";

            IDictionary tokens = new Hashtable();
            tokens.Add( "user", user );
            tokens.Add( "password", password );
            tokens.Add( "linkBack", linkBack );

            string emailBody = GenerateEmailText( tokens, "PasswordResetEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody );
        }

        #endregion

        private void NVelocityInit()
        {
            engine = new NVelocityTemplateEngine( templatesPath );
            (engine as ISupportInitialize).BeginInit();
        }

        private string GenerateEmailText( IDictionary tokens, string template )
        {
            using ( StringWriter writer = new StringWriter() )
            {
                NVelocityInit();
                engine.Process( tokens, template, writer );
                return writer.ToString();
            }
        }

        private void SendMail( string fromEmail, string toEmail, string emailSubject, string emailBody )
        {
            MailMessage message = new MailMessage( fromEmail, toEmail, emailSubject, emailBody );
            message.BodyEncoding = Encoding.Default;
            message.IsBodyHtml = true;

            SmtpClient smtpClient = new SmtpClient();

            smtpClient.Send( message );
        }

        private void SendMail( string toEmail, string emailSubject, string emailBody )
        {
            SendMail( ConfigurationManager.AppSettings["DefaultEmail"], toEmail, emailSubject, emailBody );
        }
    }
}
