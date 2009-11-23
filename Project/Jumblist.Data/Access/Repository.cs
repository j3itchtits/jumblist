using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Data.Access
{
    public class Repository : IRepository
    {

        #region IRepository Members

        public string HelloWorld
        {
            get { return "Hello World"; }
        }

        #endregion
    }
}
