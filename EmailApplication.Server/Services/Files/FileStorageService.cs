//==============================================================================
// Filename: FileStorageService.cs
// Author: Aaron Thompson
// Date Created: 4/28/2026
// Last Updated: 4/28/2026
//
// Description: File storage (cloud) services which handles packaging information from the
// AWS and handles logic to prepare for JWT.
//==============================================================================
using Amazon.S3;
using Amazon.S3.Model;
using Amazon.S3.Transfer;
using EmailApplication.Server.Config;
using Microsoft.Extensions.Options;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Services.Files {
    public interface IFileStorageService {

    }

    public class FileStorageService : IFileStorageService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IAmazonS3 _s3Client;
        private readonly AWSConfig _config;

        public FileStorageService(IAmazonS3 s3Client, IOptions<AWSConfig> config) {
            _s3Client = s3Client;
            _config = config.Value;
        }

        public string GetAttachmentURL(string key) {
            var request = new GetPreSignedUrlRequest {
                BucketName = _config.Bucket,
                Key = key,
                Expires = DateTime.UtcNow.AddMinutes(_config.PresignedUrlExpiryMinutes),
            };

            return _s3Client.GetPreSignedURL(request);
        }

        public async Task<string> UploadAttachment(Stream fileStream, string fileName, string fileID, string contentType) {
            var key = $"attachments/{fileID}/{fileName}";
            var uploadRequest = new TransferUtilityUploadRequest {
                BucketName = _config.Bucket,
                Key = key,
                InputStream = fileStream,
                ContentType = contentType,
                ServerSideEncryptionCustomerMethod = ServerSideEncryptionCustomerMethod.AES256,
                Metadata = {
                    ["original-filename"] = fileName,
                    ["file-id"] = fileID,
                    ["upload-date"] = DateTime.UtcNow.ToString("0")
                }
            };

            var transferUtility = new TransferUtility(_s3Client);
            await transferUtility.UploadAsync(uploadRequest);

            return key;
        }
    }
} //END NAMESPACE EmailApplication.Server.Services.Files
//==============================================================================
//==============================================================================