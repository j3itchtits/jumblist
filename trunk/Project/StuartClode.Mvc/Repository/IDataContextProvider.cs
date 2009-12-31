using System;
using System.Data.Linq;

namespace StuartClode.Mvc.Repository
{
    public interface IDataContextProvider : IDisposable
    {
        DataContext DataContext { get; }
    }
}
