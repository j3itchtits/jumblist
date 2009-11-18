using Jumblist.Data.Entity;

namespace Jumblist.Services
{
    public interface IBasketSubmitter
    {
        void SubmitBasket( Basket basket );
    }
}