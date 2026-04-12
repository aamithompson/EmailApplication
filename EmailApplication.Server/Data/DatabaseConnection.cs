using Microsoft.Data.SqlClient;

namespace EmailApplication.Data
{
    public class DatabaseConnection {
        private readonly string _connectionString;
        public DatabaseConnection(IConfiguration configuration) {
            _connectionString = configuration.GetConnectionString("EmailApplicationDB");
        }

        public SqlConnection GetConnection() {
            return new SqlConnection(_connectionString);
        }
    }
}
