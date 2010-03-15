using Jumblist.Core.Model;

namespace Jumblist.Core.Service
{
    public interface IBasketSubmitter
    {
        void SubmitBasket( Jumblist.Core.Model.Basket basket );
    }
}