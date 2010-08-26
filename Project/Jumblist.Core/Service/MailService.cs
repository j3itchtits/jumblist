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
        string homeUrl = ConfigurationManager.AppSettings["DefaultUrl"];

        #region IMailService Members

        public void SendRegistrationVerificationEmail( User user )
        {
            string emailSubject = "Verification Mail";

            string encryptedId = user.UserId.ToString().EncryptString();
            string encryptedUrlEncodedId = HttpUtility.UrlEncode( encryptedId );
            string urlEncodedEmail = HttpUtility.UrlEncode( user.Email );
            string linkBack = homeUrl + "/users/verifyregistration?userid=" + encryptedUrlEncodedId + "&useremail=" + urlEncodedEmail;

            IDictionary tokens = new Hashtable();
            tokens.Add( "user", user );
            tokens.Add( "linkBack", linkBack );

            string emailBody = GenerateEmailText( tokens, "RegistrationVerificationEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody, true );
        }

        public void SendPostEmail( Post post, User user )
        {
            string emailSubject = "Post Mail";

            IDictionary tokens = new Hashtable();
            tokens.Add( "post", post );
            tokens.Add( "user", user );
            tokens.Add( "postdate", post.PublishDateTime.ToFriendlyJumblistLongDateTimeString( false ) );
            tokens.Add( "homeurl", homeUrl );

            string emailBody = GenerateEmailText( tokens, "PostEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody, true );
        }

        public void SendBasketEmail( Basket basket, User user )
        {
            string emailSubject = "Basket Mail";

            IDictionary tokens = new Hashtable();
            tokens.Add( "basket", basket );
            tokens.Add( "user", user );
            tokens.Add( "homeurl", homeUrl );

            string emailBody = GenerateEmailText( tokens, "BasketEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody, true );
        }

        public void SendForgottenPasswordEmail( User user )
        {
            string emailSubject = "Forgotten Password";

            string encryptedId = user.UserId.ToString().EncryptString();
            string encryptedUrlEncodedId = HttpUtility.UrlEncode( encryptedId );
            string linkBack = homeUrl + "/users/passwordreset?reset=" + encryptedUrlEncodedId;

            IDictionary tokens = new Hashtable();
            tokens.Add( "user", user );
            tokens.Add( "linkBack", linkBack );

            string emailBody = GenerateEmailText( tokens, "ForgottenPasswordEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody, true );
        }

        public void SendPasswordResetEmail( User user, string password )
        {
            string emailSubject = "Your new password";

            string linkBack = homeUrl + "/users/login";

            IDictionary tokens = new Hashtable();
            tokens.Add( "user", user );
            tokens.Add( "password", password );
            tokens.Add( "linkBack", linkBack );

            string emailBody = GenerateEmailText( tokens, "PasswordResetEmail.vm" );

            SendMail( user.Email, emailSubject, emailBody, true );
        }

        public void SendEmailAlert( UserAlert userAlert, IEnumerable<Post> postList )
        {
            string emailSubject = "Email Alerter";

            postList.ToList().ForEach( x => x.TimeSincePublished = x.PublishDateTime.ToFriendlyJumblistAlternateShortDateTimeString() );

            IDictionary tokens = new Hashtable();
            tokens.Add( "userAlert", userAlert );
            tokens.Add( "postList", postList );
            tokens.Add( "homeurl", homeUrl );

            string emailBody = GenerateEmailText( tokens, "EmailAlert.vm" );

            SendMail( userAlert.User.Email, emailSubject, emailBody, true );
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

        private void SendMail( string fromEmail, string toEmail, string emailSubject, string emailBody, bool isBodyHtml )
        {
            //MailMessage message = new MailMessage( fromEmail, toEmail, emailSubject, emailBody );

            MailMessage message = new MailMessage();

            message.From = new MailAddress( fromEmail, "Jumblist" );
            message.To.Add( toEmail );
            message.Bcc.Add( ConfigurationManager.AppSettings["AdminEmail"] );
            message.Subject = emailSubject;
            message.Body = emailBody;

            //message.BodyEncoding = Encoding.Default;
            message.IsBodyHtml = isBodyHtml;

            SmtpClient smtpClient = new SmtpClient();

            smtpClient.Send( message );
        }

        private void SendMail( string toEmail, string emailSubject, string emailBody )
        {
            SendMail( ConfigurationManager.AppSettings["DefaultEmail"], toEmail, emailSubject, emailBody, false );
        }

        private void SendMail( string fromEmail, string toEmail, string emailSubject, string emailBody )
        {
            SendMail( fromEmail, toEmail, emailSubject, emailBody, false );
        }

        private void SendMail( string toEmail, string emailSubject, string emailBody, bool isHtml )
        {
            SendMail( ConfigurationManager.AppSettings["DefaultEmail"], toEmail, emailSubject, emailBody, isHtml );
        }
    }
}
