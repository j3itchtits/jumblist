using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Data.Entity
{
    public class EntityBase : IEntityBase
    {

        #region IEntityBase Members

        public virtual string EntityText
        {
            get { return "Hello World"; }
        }

        #endregion
    }
}
