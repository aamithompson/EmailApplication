//==============================================================================
// Filename: DatabaseConnection.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 4/7/2026
//
// Description: Handles estabilishing the connection with the database and
// reading the configuration file.
//==============================================================================
using Microsoft.Data.SqlClient;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Data {
    public class DatabaseConnection {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly string _connectionString;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public DatabaseConnection(IConfiguration configuration) {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
            //_connectionString = configuration.GetConnectionString("EmailApplicationDB");
        }

// FUNCTION(s)
//------------------------------------------------------------------------------
        public SqlConnection GetConnection() {
            return new SqlConnection(_connectionString);
        }
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================