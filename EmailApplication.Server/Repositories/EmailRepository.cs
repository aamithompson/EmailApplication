using EmailApplication.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Repositories {
    public interface IEmailRepository {
        EmailData GetEmailByMailID(int mailID);
        int InsertEmail(EmailData emailData);
        //List<EmailData> GetEmailsBySenderID(int senderID);
    }

    public class EmailRepository : IEmailRepository {

        public EmailData GetEmailByMailID(int mailID) {
            using(SqlConnection connection = DatabaseConnection.GetConnection()) {
                connection.Open();

                string query = @"
                SELECT MailID, SenderID, Subject, Body, DateCreated
                FROM Email
                WHERE MailID = @MailID";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@MailID", mailID);
                    using(SqlDataReader reader = command.ExecuteReader()) {
                        if(reader.Read()) {
                            return new EmailData{
                                MailID = reader.GetInt32(reader.GetOrdinal("MailID")),
                                SenderID = reader.GetInt32(reader.GetOrdinal("SenderID")),
                                Subject = reader.GetString(reader.GetOrdinal("Subject")),
                                Body = reader.GetString(reader.GetOrdinal("Body")),
                                DateCreated = reader.GetDateTime(reader.GetOrdinal("DateCreated"))
                            };
                        }
                    }
                }
            }

            return null;
        }

        public int InsertEmail(EmailData emailData) {
            using(SqlConnection connection = DatabaseConnection.GetConnection()) {
                connection.Open();

                string query = @"
                    INSERT INTO Email (SenderID, Subject, Body, DateCreated)
                    VALUES (@SenderID, @Subject, @Body, @DateCreated);
                    SELECT SCOPE_IDENTITY();";

                using(SqlCommand command = new SqlCommand(query,connection)) {
                    command.Parameters.AddWithValue("@SenderID", emailData.SenderID);
                    command.Parameters.AddWithValue("@Subject", emailData.Subject);
                    command.Parameters.AddWithValue("@Body", emailData.Body);
                    command.Parameters.AddWithValue("@DateCreated", emailData.DateCreated);

                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }

        //public List<EmailData> GetEmailsBySenderID(int senderID){}
    }
}
