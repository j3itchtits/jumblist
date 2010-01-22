using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using StuartClode.Mvc.Repository;
using Jumblist.Core.Model;
using Jumblist.Core.Service.Data;

namespace Jumblist.Core
{
    public class StaticDatabaseAccess
    {
        private readonly string jumblistDbConnString = @"Data Source=.\SQLEXPRESS;Initial Catalog=JumblistDatabase;Integrated Security=True;";

        public ConnectionStringProvider GetConnectionStringProvider()
        {
            return new ConnectionStringProvider( jumblistDbConnString );
        }

        public DataContextProvider GetDataContextProvider()
        {
            return new DataContextProvider( GetConnectionStringProvider() );
        }

        public Repository<Post> GetRepository()
        {
            return new Repository<Post>( GetDataContextProvider() );
        }

        public PostService GetService()
        {
            return new PostService( GetRepository() );
        }
    }
}
