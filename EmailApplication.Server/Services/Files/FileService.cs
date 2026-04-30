//==============================================================================
// Filename: FileService.cs
// Author: Aaron Thompson
// Date Created: 4/28/2026
// Last Updated: 4/28/2026
//
// Description: File services which handles packaging information from the
// repository and handles logic to prepare for JWT. This also acts as a glue
// between FileRecordService (Database) and FileStorageService (Cloud).
//==============================================================================
namespace EmailApplication.Server.Services.Files {
    public interface IFileService {

    }

    public class FileService : IFileService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IFileRecordService _fileRecordService;
        private readonly IFileStorageService _fileStorageService;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public FileService(IFileRecordService fileRecordService, IFileStorageService fileStorageService) {
            _fileRecordService = fileRecordService;
            _fileStorageService = fileStorageService;
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
    }
} //END NAMESPACE EmailApplication.Server.Services.Files
//==============================================================================
//==============================================================================
