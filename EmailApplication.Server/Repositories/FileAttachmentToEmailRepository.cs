//==============================================================================
// Filename: FileAttachmentToEmailRepository.cs
// Author: Aaron Thompson
// Date Created: 4/30/2026
// Last Updated: 4/30/2026
//
// Description: Repository to access the file attachment to email repository.
//==============================================================================
using Microsoft.Data.SqlClient;
using EmailApplication.Server.Data;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Repositories  {
    public interface IFileAttachmentToEmailRepository {
        List<FileAttachmentToEmailData> GetFileAttachmentsToEmail(int mailID);
        public void InsertFileAttachmentToEmail(FileAttachmentToEmailData fileAttachmentToEmailData);
    }

    public class FileAttachmentToEmailRepository : IFileAttachmentToEmailRepository {
// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly DatabaseConnection _db;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public FileAttachmentToEmailRepository(DatabaseConnection db) {
            _db = db;
        }

// DATABASE QUERY FUNCTION(s)
//------------------------------------------------------------------------------
        public List<FileAttachmentToEmailData> GetFileAttachmentsToEmail(int mailID) {
            List<FileAttachmentToEmailData> results = new List<FileAttachmentToEmailData>();
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                SELECT FileID, MailID
                FROM FileAttachmentToEmail
                WHERE MailID = @MailID";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@MailID", mailID);

                    using (SqlDataReader reader = command.ExecuteReader()) {
                        int fileIDOrdinal = reader.GetOrdinal("FileID");
                        int mailIDOrdinal = reader.GetOrdinal("MailID");
                        while(reader.Read()) {
                            FileAttachmentToEmailData obj = new FileAttachmentToEmailData() {
                                FileID = reader.GetInt32(fileIDOrdinal),
                                MailID = reader.GetInt32(mailIDOrdinal)
                            };

                            results.Add(obj);
                        }
                    }
                }
            }

            return results;
        }

        public void InsertFileAttachmentToEmail(FileAttachmentToEmailData fileAttachmentToEmailData) {
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                    INSERT INTO FileAttachmentToEmail (FileID, MailID)
                    VALUES (@FileID, @MailID);";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@FileID", fileAttachmentToEmailData.FileID);
                    command.Parameters.AddWithValue("@MailID", fileAttachmentToEmailData.MailID);

                    command.ExecuteNonQuery();
                }
            }
        }
    }
} //END NAMESPACE EmailApplication.Server.Repositories
//==============================================================================
//==============================================================================