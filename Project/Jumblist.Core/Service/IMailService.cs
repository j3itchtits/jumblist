using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public interface IMailService
    {
        void SendRegistrationVerificationEmail( User user );
        void SendPostEmail( Post post, User user );
        void SendBasketEmail( User user );
        void SendForgottenPasswordEmail( User user );
        void SendPasswordResetEmail( User user, string password );
    }
}