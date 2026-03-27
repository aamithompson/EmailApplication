using Microsoft.Data.SqlClient;
using System.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Data
{
    public class DatabaseConnection {
        private static string _connectionString = ConfigurationManager.ConnectionStrings["EmailApplicationDB"].ConnectionString;

        public static SqlConnection GetConnection() {
            return new SqlConnection(_connectionString);
        }
    }
}
