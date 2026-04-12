using EmailApplication.Data;
using EmailApplication.Enums;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Repositories {
    public interface IEmailRoReceiverRepository {
        List<EmailToReceiverData> GetReceiversByMailID(int mailID);
        public void InsertEmailToReceiver(EmailToReceiverData emailToReceiverData);
    }

    public class EmailToReceiverRepository : IEmailRoReceiverRepository {
        private readonly DatabaseConnection _db;

        public EmailToReceiverRepository(DatabaseConnection db) {
            _db = db;
        }

        public List<EmailToReceiverData> GetReceiversByMailID(int mailID) {
            List<EmailToReceiverData> receivers = new List<EmailToReceiverData>();
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                SELECT MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead
                FROM EmailToReceiver
                WHERE MailID = @MailID";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@MailID", mailID);

                    using (SqlDataReader reader = command.ExecuteReader()) {
                        int mailIDOrdinal = reader.GetOrdinal("MailID");
                        int receiverIDOrdinal = reader.GetOrdinal("ReceiverID");
                        int mailStatusOrdinal = reader.GetOrdinal("MailStatus");
                        int markedOrdinal = reader.GetOrdinal("Marked");
                        int trashedOrdinal = reader.GetOrdinal("Trashed");
                        int dateTrashedOrdinal = reader.GetOrdinal("DateTrashed");
                        int dateSentOrdinal = reader.GetOrdinal("DateSent");
                        int dateReceivedOrdinal = reader.GetOrdinal("DateReceived");
                        int dateReadOrdinal = reader.GetOrdinal("DateRead");
                        while(reader.Read()) {
                            EmailToReceiverData obj = new EmailToReceiverData() {
                                MailID = reader.GetInt32(mailIDOrdinal),
                                ReceiverID = reader.GetInt32(receiverIDOrdinal),
                                MailStatus = (EmailStatus)reader.GetInt32(mailStatusOrdinal),
                                Marked = reader.GetBoolean(markedOrdinal),
                                Trashed = reader.GetBoolean(trashedOrdinal),
                                DateTrashed = reader.IsDBNull(dateTrashedOrdinal) ? (DateTime?)null : reader.GetDateTime(dateTrashedOrdinal),
                                DateSent = reader.GetDateTime(dateSentOrdinal),
                                DateReceived = reader.IsDBNull(dateTrashedOrdinal) ? (DateTime?)null : reader.GetDateTime(dateReceivedOrdinal),
                                DateRead = reader.IsDBNull(dateTrashedOrdinal) ? (DateTime?)null : reader.GetDateTime(dateReadOrdinal)
                            };

                            receivers.Add(obj);
                        }
                    }
                }
            }

            return receivers;
        }

        public List<EmailToReceiverData> GetEmailsByReceiverID(int receiverID) {
            List<EmailToReceiverData> emails = new List<EmailToReceiverData>();
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                SELECT MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead
                FROM EmailToReceiver
                WHERE ReceiverID = @ReceiverID";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@ReceiverID", receiverID);

                    using (SqlDataReader reader = command.ExecuteReader()) {
                        int mailIDOrdinal = reader.GetOrdinal("MailID");
                        int receiverIDOrdinal = reader.GetOrdinal("ReceiverID");
                        int mailStatusOrdinal = reader.GetOrdinal("MailStatus");
                        int markedOrdinal = reader.GetOrdinal("Marked");
                        int trashedOrdinal = reader.GetOrdinal("Trashed");
                        int dateTrashedOrdinal = reader.GetOrdinal("DateTrashed");
                        int dateSentOrdinal = reader.GetOrdinal("DateSent");
                        int dateReceivedOrdinal = reader.GetOrdinal("DateReceived");
                        int dateReadOrdinal = reader.GetOrdinal("DateRead");
                        while(reader.Read()) {
                            EmailToReceiverData obj = new EmailToReceiverData() {
                                MailID = reader.GetInt32(mailIDOrdinal),
                                ReceiverID = reader.GetInt32(receiverIDOrdinal),
                                MailStatus = (EmailStatus)reader.GetInt32(mailStatusOrdinal),
                                Marked = reader.GetBoolean(markedOrdinal),
                                Trashed = reader.GetBoolean(trashedOrdinal),
                                DateTrashed = reader.IsDBNull(dateTrashedOrdinal) ? (DateTime?)null : reader.GetDateTime(dateTrashedOrdinal),
                                DateSent = reader.GetDateTime(dateSentOrdinal),
                                DateReceived = reader.IsDBNull(dateTrashedOrdinal) ? (DateTime?)null : reader.GetDateTime(dateReceivedOrdinal),
                                DateRead = reader.IsDBNull(dateTrashedOrdinal) ? (DateTime?)null : reader.GetDateTime(dateReadOrdinal)
                            };

                            emails.Add(obj);
                        }
                    }
                }
            }

            return emails;
        }

        public void InsertEmailToReceiver(EmailToReceiverData emailToReceiverData) {
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                    INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
                    VALUES (@MailID, @ReceiverID, @MailStatus, @Marked, @Trashed, @DateTrashed, @DateSent, @DateReceived, @DateRead);
                    SELECT SCOPE_IDENTITY();";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@MailID", emailToReceiverData.MailID);
                    command.Parameters.AddWithValue("@ReceiverID", emailToReceiverData.ReceiverID);
                    command.Parameters.AddWithValue("@MailStatus", emailToReceiverData.MailStatus);
                    command.Parameters.AddWithValue("@Marked", emailToReceiverData.Marked);
                    command.Parameters.AddWithValue("@Trashed", emailToReceiverData.Trashed);
                    if(emailToReceiverData.DateTrashed == null) {
                        command.Parameters.AddWithValue("@DateTrashed", DBNull.Value); 
                    } else {
                        command.Parameters.AddWithValue("@DateTrashed", emailToReceiverData.DateTrashed);
                    }
                    command.Parameters.AddWithValue("@DateSent", emailToReceiverData.DateSent);
                    if(emailToReceiverData.DateReceived == null) {
                        command.Parameters.AddWithValue("@DateReceived", DBNull.Value); 
                    } else {
                        command.Parameters.AddWithValue("@DateReceived", emailToReceiverData.DateReceived);
                    }
                    if(emailToReceiverData.DateRead == null) {
                        command.Parameters.AddWithValue("@DateRead", DBNull.Value); 
                    } else {
                        command.Parameters.AddWithValue("@DateRead", emailToReceiverData.DateRead);
                    }

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
