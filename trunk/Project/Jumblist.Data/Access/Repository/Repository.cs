using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Jumblist.Data.Access
{
    public class Repository
    {
        public string ConnectionString { get; private set; }

        public Repository() { }

        public Repository( string connectionString )
        {
            ConnectionString = connectionString;
        }
    }
}
