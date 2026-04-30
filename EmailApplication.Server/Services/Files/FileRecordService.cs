//==============================================================================
// Filename: FileRecordService.cs
// Author: Aaron Thompson
// Date Created: 4/28/2026
// Last Updated: 4/30/2026
//
// Description: File record (database) services which handles packaging information from the
// repository and handles logic to prepare for JWT.
//==============================================================================
using EmailApplication.Server.Repositories;
using EmailApplication.Server.Data;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Services.Files {
    public interface IFileRecordService {
        public (int FileID, string BucketKey) InsertFileAttachmentRecord(IFormFile file, int uploaderID);
        public void RemoveFileAttachmentRecord(int fileID);
        public void InsertFileAttachmentToEmail(int fileID, int mailID);
        public string GetBucketKey(int fileID);
        public List<string> GetBucketKeysForEmail(int mailID);
    }

    public class FileRecordService : IFileRecordService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IFileAttachmentRepository _fileRepository;
        private readonly IFileAttachmentToEmailRepository _fileAttachmentToEmailRepository;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public FileRecordService(IFileAttachmentRepository fileRepository, IFileAttachmentToEmailRepository fileAttachmentToEmailRepository) {
            _fileRepository = fileRepository;
            _fileAttachmentToEmailRepository = fileAttachmentToEmailRepository;
        }

// SERVICE FUNCTION(s)
//------------------------------------------------------------------------------
        public (int FileID, string BucketKey) InsertFileAttachmentRecord(IFormFile file, int uploaderID) { 
            FileAttachmentData data = new FileAttachmentData {
                UploaderID = uploaderID,
                FileName = file.FileName,
                FileSize = file.Length,
                DateUploaded = DateTime.UtcNow,
                DateLastReferenced = DateTime.UtcNow,
                ReferenceCount = 0
            };

            return _fileRepository.InsertFileAttachment(data);
        }

        public void RemoveFileAttachmentRecord(int fileID) {
            _fileRepository.RemoveFileAttachment(fileID);
        }

        public void InsertFileAttachmentToEmail(int fileID, int mailID) {
            FileAttachmentToEmailData data = new FileAttachmentToEmailData {
                FileID = fileID,
                MailID = mailID
            };

            _fileAttachmentToEmailRepository.InsertFileAttachmentToEmail(data);
        }

        public string GetBucketKey(int fileID) {
            FileAttachmentData data = _fileRepository.GetFileAttachment(fileID);
            if(data == null) {
                return "";
            }

            return data.BucketKey;
        }

        public List<string> GetBucketKeysForEmail(int mailID) {
            List<string> keys = new List<string>();

            List<FileAttachmentToEmailData> files = _fileAttachmentToEmailRepository.GetFileAttachmentsToEmail(mailID);
            for(int i = 0; i < files.Count; i++) {
                string key = GetBucketKey(files[i].FileID);
                if(key != null && key != "") {
                    keys.Add(key);
                }
            }

            return keys;
        }
    }
} //END NAMESPACE EmailApplication.Server.Services.Files
//==============================================================================
//==============================================================================