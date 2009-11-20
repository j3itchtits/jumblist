using Jumblist.Data.Entity;

namespace Jumblist.Core
{
    public interface IBasketSubmitter
    {
        void SubmitBasket( Basket basket );
    }
}