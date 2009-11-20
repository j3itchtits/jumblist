using Jumblist.Data.Entity;

namespace Jumblist.Core.Service
{
    public interface IBasketSubmitter
    {
        void SubmitBasket( Basket basket );
    }
}