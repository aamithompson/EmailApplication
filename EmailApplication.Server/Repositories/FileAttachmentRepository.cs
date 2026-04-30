//==============================================================================
// Filename: FileAttachmentRepository.cs
// Author: Aaron Thompson
// Date Created: 4/30/2026
// Last Updated: 4/30/2026
//
// Description: Repository to access the file attachment repository.
//==============================================================================
using Microsoft.Data.SqlClient;
using EmailApplication.Server.Data;
using Amazon.S3.Model;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Repositories {
    public interface IFileAttachmentRepository {
        FileAttachmentData GetFileAttachment(int fileID);
        public (int FileID, string BucketKey) InsertFileAttachment(FileAttachmentData fileAttachmentData);
        public void RemoveFileAttachment(int fileID);
    }

    public class FileAttachmentRepository : IFileAttachmentRepository {
        
// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly DatabaseConnection _db;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public FileAttachmentRepository(DatabaseConnection db) {
            _db = db;
        }

// DATABASE QUERY FUNCTION(s)
//------------------------------------------------------------------------------
        public FileAttachmentData GetFileAttachment(int fileID) {
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                SELECT FileID, BucketKey, UploaderID, FileName, FileSize, DateUploaded, DateLastReferenced, ReferenceCount
                FROM FileAttachment
                WHERE FileID = @FileID";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@FileID", fileID);

                    using (SqlDataReader reader = command.ExecuteReader()) {
                        int fileIDOrdinal = reader.GetOrdinal("FileID");
                        int bucketKeyOrdinal = reader.GetOrdinal("BucketKey");
                        int uploaderIDOrdinal = reader.GetOrdinal("UploaderID");
                        int fileNameOrdinal = reader.GetOrdinal("FileName");
                        int fileSizeOrdinal = reader.GetOrdinal("FileSize");
                        int dateUploadedOrdinal = reader.GetOrdinal("DateUploaded");
                        int dateLastReferencedOrdinal = reader.GetOrdinal("DateLastReferenced");
                        int referenceCountOrdinal = reader.GetOrdinal("ReferenceCount");
                        while(reader.Read()) {
                            return new FileAttachmentData() {
                                FileID = reader.GetInt32(fileIDOrdinal),
                                BucketKey = reader.GetString(bucketKeyOrdinal),
                                UploaderID = reader.GetInt32(uploaderIDOrdinal),
                                FileName = reader.GetString(fileNameOrdinal),
                                FileSize = reader.GetInt64(fileSizeOrdinal),
                                DateUploaded = reader.GetDateTime(dateUploadedOrdinal),
                                DateLastReferenced = reader.GetDateTime(dateLastReferencedOrdinal),
                                ReferenceCount = reader.GetInt32(referenceCountOrdinal)
                            };
                        }
                    }
                }
            }

            return null;
        }

        public (int FileID, string BucketKey) InsertFileAttachment(FileAttachmentData fileAttachmentData) {
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                //Initial insertion occurs without bucket key because the bucket key
                //is dependent on the fileID since buckey key = attachments/fileID/fileName
                //and the fileID is produced on insertion.
                string query = @"
                    INSERT INTO FileAttachment (UploaderID, FileName, FileSize, DateUploaded, DateLastReferenced, ReferenceCount)
                    VALUES (@UploaderID, @FileName, @FileSize, @DateUploaded, @DateLastReferenced, @ReferenceCount);
                    SELECT SCOPE_IDENTITY();";

                int fileID;
                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@UploaderID", fileAttachmentData.UploaderID);
                    command.Parameters.AddWithValue("@FileName", fileAttachmentData.FileName);
                    command.Parameters.AddWithValue("@FileSize", fileAttachmentData.FileSize);
                    command.Parameters.AddWithValue("@DateUploaded", fileAttachmentData.DateUploaded);
                    command.Parameters.AddWithValue("@DateLastReferenced", fileAttachmentData.DateLastReferenced);
                    command.Parameters.AddWithValue("@ReferenceCount", fileAttachmentData.ReferenceCount);

                    fileID = Convert.ToInt32(command.ExecuteScalar());
                }

                //Update bucket key
                string bucketKey = $"attachments/{fileID}/{fileAttachmentData.FileName}";
                query = @"
                    UPDATE FileAttachment
                    SET BucketKey = @BucketKey
                    WHERE FileID = @FileID";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@BucketKey", bucketKey);
                    command.Parameters.AddWithValue("@FileID", fileID);

                    command.ExecuteNonQuery();
                }

                return (fileID, bucketKey);
            }
        }

        public void RemoveFileAttachment(int fileID) {
            using (SqlConnection connection = _db.GetConnection()) {
                connection.Open();

                string query = @"
                    DELETE FROM FileAttachment
                    WHERE FileID = @FileID;";

                using (SqlCommand command = new SqlCommand(query, connection)) {
                    command.Parameters.AddWithValue("@FileID", fileID);

                    command.ExecuteNonQuery();
                }
            }
        }
    }
} //END NAMESPACE EmailApplication.Server.Repositories
//==============================================================================
//==============================================================================