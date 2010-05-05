using Jumblist.Core.Model;

namespace Jumblist.Core.Service.Basket
{
    public interface IBasketSubmitter
    {
        void SubmitBasket( Jumblist.Core.Model.Basket basket );
    }
}