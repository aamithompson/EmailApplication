//==============================================================================
// Filename: FileService.cs
// Author: Aaron Thompson
// Date Created: 4/28/2026
// Last Updated: 5/1/2026
//
// Description: File services which handles packaging information from the
// repository and handles logic to prepare for JWT. This also acts as a glue
// between FileRecordService (Database) and FileStorageService (Cloud).
//==============================================================================
using Amazon.S3.Model;
using EmailApplication.Server.Config;
using EmailApplication.Server.Repositories;
using EmailApplication.Shared;

namespace EmailApplication.Server.Services.Files {
    public interface IFileService {
        public Task<int> UploadFileAttachment(IFormFile file, int uploaderID);
        public bool AttachFileAttachmentToEmail(SendEmailDTO dto, int mailID, int senderID);
        public FileAttachmentURLDTO GetFileAttachmentURL(int fileID);
    }

    public class FileService : IFileService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IFileRecordService _fileRecordService;
        private readonly IFileStorageService _fileStorageService;
        private readonly AWSConfig _awsConfig;

        // CONSTRUCTOR(s)
        //------------------------------------------------------------------------------
        public FileService(IFileRecordService fileRecordService, IFileStorageService fileStorageService, AWSConfig awsConfig) {
            _fileRecordService = fileRecordService;
            _fileStorageService = fileStorageService;
            _awsConfig = awsConfig;
        }

// SERVICE FUNCTION(s)
//------------------------------------------------------------------------------
        public async Task<int> UploadFileAttachment(IFormFile file, int uploaderID) {
            (int fileID, string bucketKey) = _fileRecordService.InsertFileAttachmentRecord(file, uploaderID);

            try {
                await _fileStorageService.UploadFileAttachment(
                        file.OpenReadStream(), 
                        file.FileName, 
                        fileID, 
                        bucketKey, 
                        file.ContentType);
            } catch {
                _fileRecordService.RemoveFileAttachmentRecord(fileID);
                throw;
            }

            return fileID;
        }

        public bool AttachFileAttachmentToEmail(SendEmailDTO dto, int mailID, int senderID) {
            int n = dto.FileIDs.Count;
            if(n == 0) {
                return true;
            }

            for (int i = 0; i < n; i++) {
                int fileID = dto.FileIDs[i];
                int uploaderID = _fileRecordService.GetUploaderID(fileID);
                //Security check to ensure individuals do not get access files not theirs.
                //With further implementation, would be best to record the individual as
                //a potential security risk.
                if(senderID != uploaderID) {
                    continue;
                }

                _fileRecordService.InsertFileAttachmentToEmail(fileID, mailID);
            }

            return true;
        }

        public FileAttachmentURLDTO GetFileAttachmentURL(int fileID) {
            //TODO: check if they are an uploader OR they are on the recipient list
            //for the mail that has the file id AND the file id is attached to the mailID
            string bucketKey = _fileRecordService.GetBucketKey(fileID);
            string url = _fileStorageService.GetFileAttachmentURL(bucketKey);

            return new FileAttachmentURLDTO {
                URL = url,
                ExpiryMinutes = _awsConfig.PresignedUrlExpiryMinutes
            };
        }
    }
} //END NAMESPACE EmailApplication.Server.Services.Files
//==============================================================================
//==============================================================================
