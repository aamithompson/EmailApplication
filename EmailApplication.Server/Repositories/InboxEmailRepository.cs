//==============================================================================
// Filename: InboxEmailRepository.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 4/7/2026
//
// Description: Repository to access email table, however, this repository is
// optimized for selecting specifically what is listed information in the inbox
// to prevent having to search the account and email to receiver table everytime
// for a new email.
//==============================================================================
using Microsoft.Data.SqlClient;
using EmailApplication.Server.Data;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Repositories {
    public interface IInboxEmailRepository {
        List<InboxEmailData> GetInboxEmailDatas(int accountID);
    }

    public class InboxEmailRepository : IInboxEmailRepository {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public const int _BODYPREVIEWSIZE = 100;

        private readonly DatabaseConnection _db;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public InboxEmailRepository(DatabaseConnection db) {
            _db = db;
        }

// DATABASE QUERY FUNCTION(s)
//------------------------------------------------------------------------------
        public List<InboxEmailData> GetInboxEmailDatas(int accountID) {
            List<InboxEmailData> emails = new List<InboxEmailData>();

            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @$"
                                SELECT e.MailID, a.EmailAddress AS Sender, e.Subject, LEFT(e.Body, {_BODYPREVIEWSIZE}) AS Preview, etr.DateReceived, etr.DateRead
                                FROM EmailToReceiver AS etr
                                JOIN Email e ON etr.MailID = e.MailID
                                JOIN Account a ON e.SenderID = a.AccountID
                                WHERE etr.ReceiverID = @AccountID
                                AND etr.Trashed = 0
                                ORDER BY etr.DateReceived DESC";
                
                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@AccountID", accountID);

                    using (SqlDataReader reader = command.ExecuteReader()) {
                        int mailIDOrdinal = reader.GetOrdinal("MailID");
                        int senderOrdinal = reader.GetOrdinal("Sender");
                        int subjectOrdinal = reader.GetOrdinal("Subject");
                        int previewOrdinal = reader.GetOrdinal("Preview");
                        int dateReceivedOrdinal = reader.GetOrdinal("DateReceived");
                        int dateReadOrdinal = reader.GetOrdinal("DateRead");

                        while(reader.Read()) {
                            emails.Add(new InboxEmailData {
                                MailID = reader.GetInt32(mailIDOrdinal),
                                Sender = reader.GetString(senderOrdinal),
                                Subject = reader.GetString(subjectOrdinal),
                                Preview = reader.GetString(previewOrdinal),
                                DateReceived = reader.IsDBNull(dateReceivedOrdinal) ? null : reader.GetDateTime(dateReceivedOrdinal),
                                DateRead = reader.IsDBNull(dateReadOrdinal) ? null : reader.GetDateTime(dateReadOrdinal),
                            });
                        }
                    }
                }
            }

            return emails;
        }
    }
} //END NAMESPACE EmailApplication.Server.Repositories
//==============================================================================
//==============================================================================