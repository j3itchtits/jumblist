using Jumblist.Core.Model;
using System.Collections.Generic;

namespace Jumblist.Core.Service
{
    public interface IMailService
    {
        void SendRegistrationVerificationEmail( User user );
        void SendTestEmail( Post post, User user );
        void SendTestEmail( User user );
        void SendPostEmail( Post post, User user );
        void SendPostEmail( Post post, string email );
        void SendBasketEmail( Basket basket, User user );
        void SendForgottenPasswordEmail( User user );
        void SendPasswordResetEmail( User user, string password );
        void SendEmailAlert( UserAlert userAlert, IEnumerable<Post> postList );
    }
}