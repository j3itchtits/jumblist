using Jumblist.Data.Entity;

namespace Jumblist.Services.Basket
{
    public interface IBasketSubmitter
    {
        void SubmitBasket( Jumblist.Data.Entity.Basket basket );
    }
}