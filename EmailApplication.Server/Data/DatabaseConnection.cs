using Microsoft.Data.SqlClient;

namespace EmailApplication.Data
{
    public class DatabaseConnection {
        private static string _connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EmailApplicationDB"].ConnectionString;

        public static SqlConnection GetConnection() {
            return new SqlConnection(_connectionString);
        }
    }
}
