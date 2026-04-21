//==============================================================================
// Filename: AccountInboxStatusRepository.cs
// Author: Aaron Thompson
// Date Created: 4/20/2026
// Last Updated: 4/21/2026
//
// Description: Repository to access account inbox status table.
//==============================================================================
using Microsoft.Data.SqlClient;
using EmailApplication.Server.Data;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Repositories {
    public interface IAccountInboxStateRepository {
        AccountInboxStateData GetAccountInboxStateData(int accountID, int category);
        int UpdateAccountInboxStateData(int accountID, int category);
    }

    public class AccountInboxStateRepository : IAccountInboxStateRepository {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly DatabaseConnection _db;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public AccountInboxStateRepository(DatabaseConnection db) {
            _db = db;
        }

// DATABASE QUERY FUNCTION(s)
//------------------------------------------------------------------------------
        public AccountInboxStateData GetAccountInboxStateData(int accountID, int category) {
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                SELECT StateID, AccountID, Category, MailCount, DateLastModified
                FROM AccountInboxState
                WHERE AccountID = @AccountID AND Category = @Category";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@AccountID", accountID);
                    command.Parameters.AddWithValue("@Category", category);
                    using (SqlDataReader reader = command.ExecuteReader()) {
                        if (reader.Read()) {
                            return new AccountInboxStateData {
                                StateID = reader.GetInt32(reader.GetOrdinal("StateID")),
                                AccountID = reader.GetInt32(reader.GetOrdinal("AccountID")),
                                Category = reader.GetInt32(reader.GetOrdinal("Category")),
                                MailCount = reader.GetInt32(reader.GetOrdinal("MailCount")),
                                DateLastModified = reader.GetDateTime(reader.GetOrdinal("DateLastModified"))
                            };
                        }
                    }
                }
            }

            return null;
        }

        public int UpdateAccountInboxStateData(int accountID, int category) {
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                MERGE AccountInboxState AS target
                USING (VALUES (@AccountID, @Category, @DateLastModified))
                    AS source (AccountID, Category, DateLastModified)
                ON target.AccountID = source.AccountID
                    AND target.Category = source.Category
                WHEN MATCHED THEN
                    UPDATE SET DateLastModified = source.DateLastModified, MailCount = MailCount + 1
                WHEN NOT MATCHED THEN
                    INSERT (AccountID, Category, DateLastModified, MailCount)
                    VALUES (@AccountID, @Category, @DateLastModified, 1);
                ";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@AccountID", accountID);
                    command.Parameters.AddWithValue("@Category", category);
                    command.Parameters.AddWithValue("@DateLastModified", DateTime.Now);

                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }
    }
} //END NAMESPACE EmailApplication.Server.Repositories
//==============================================================================
//==============================================================================
