using EmailApplication.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Repositories {
    public interface IAccountRepository {
        AccountData GetAccountDataByID(int accountID);
        AccountData GetAccountDataByEmailAddress(string emailAddress);
        int InsertAccount(AccountData accountData);
    }

    public class AccountRepository : IAccountRepository{
        public AccountData GetAccountDataByID(int accountID){
            using(SqlConnection connection = DatabaseConnection.GetConnection()) {
                connection.Open();

                string query = @"
                SELECT AccountID, EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin
                FROM Account
                WHERE AccountID = @AccountID";

                using(SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@AccountID", accountID);
                    using(SqlDataReader reader = command.ExecuteReader()) {
                        if(reader.Read()) {
                            return new AccountData {
                                AccountID = reader.GetInt32(reader.GetOrdinal("AccountID")),
                                EmailAddress = reader.GetString(reader.GetOrdinal("EmailAddress")),
                                AccountName = reader.GetString(reader.GetOrdinal("AccountName")),
                                PasswordHash = reader.GetString(reader.GetOrdinal("PasswordHash")),
                                DateCreated = reader.GetDateTime(reader.GetOrdinal("DateCreated")),
                                DateLastLogin = reader.GetDateTime(reader.GetOrdinal("DateLastLogin"))
                            };
                        }
                    }
                }
            }

            return null;
        }

        public AccountData GetAccountDataByEmailAddress(string emailAddress){
            using(SqlConnection connection = DatabaseConnection.GetConnection()) {
                connection.Open();

                string query = @"
                SELECT AccountID, EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin
                FROM Account
                WHERE EmailAddress = @EmailAddress";

                using(SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@EmailAddress", emailAddress);
                    using(SqlDataReader reader = command.ExecuteReader()) {
                        if(reader.Read()) {
                            return new AccountData {
                                AccountID = reader.GetInt32(reader.GetOrdinal("AccountID")),
                                EmailAddress = reader.GetString(reader.GetOrdinal("EmailAddress")),
                                AccountName = reader.GetString(reader.GetOrdinal("AccountName")),
                                PasswordHash = reader.GetString(reader.GetOrdinal("PasswordHash")),
                                DateCreated = reader.GetDateTime(reader.GetOrdinal("DateCreated")),
                                DateLastLogin = reader.GetDateTime(reader.GetOrdinal("DateLastLogin"))
                            };
                        }
                    }
                }
            }

            return null;
        }

        //TODO: Write check for existing account
        //TODO: Write error handling
        public int InsertAccount(AccountData accountData) {
            using(SqlConnection connection = DatabaseConnection.GetConnection()) {
                connection.Open();

                string query = @"
                    INSERT INTO ACCOUNT (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
                    VALUES (@EmailAddress, @AccountName, @PasswordHash, @DateCreated, @DateLastLogin);
                    SELECT SCOPE_IDENTITY();";

                using(SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@EmailAddress", accountData.EmailAddress);
                    command.Parameters.AddWithValue("@AccountName", accountData.AccountName);
                    command.Parameters.AddWithValue("@PasswordHash", accountData.PasswordHash);
                    command.Parameters.AddWithValue("@DateCreated", accountData.DateCreated);
                    command.Parameters.AddWithValue("@DateLastLogin", accountData.DateLastLogin);

                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }
    }
}