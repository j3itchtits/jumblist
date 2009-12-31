namespace StuartClode.Mvc.Repository
{
    public class ConnectionStringProvider : IConnectionStringProvider
    {
        public string ConnectionString { get; private set; }

        public ConnectionStringProvider(string connectionString)
        {
            ConnectionString = connectionString;
        }
    }
}
