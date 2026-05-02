//==============================================================================
// Filename: FileAPIService.cs
// Author: Aaron Thompson
// Date Created: 5/2/2026
// Last Updated: 5/2/2026
//
// Description: API Service regarding files which handles making requests to
// the server and retrieving the results for the client side.
// POST UploadFile->
//==============================================================================
using EmailApplication.Shared;
using System.Net.Http;
using System.Net.Http.Headers;
using System.IO;
using Microsoft.AspNetCore.StaticFiles;
using System.Net.Http.Json;
using Microsoft.AspNetCore.Http;

namespace EmailApplication.Client.APIServices {
    public interface IFileAPIService {
        Task<int> UploadFile(string filePath);
        Task<FileAttachmentURLDTO> GetFileURL(int fileID);
    }

    public class FileAPIService : IFileAPIService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly HttpClient _httpClient;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public FileAPIService(HttpClient httpClient) {
            _httpClient = httpClient;
        }

// REQUEST(s)/RESPONSE(s)
//------------------------------------------------------------------------------
        public async Task<int> UploadFile(string filePath) {
            using var content = new MultipartFormDataContent();
            using var fileStream = File.OpenRead(filePath);
            using var streamContent = new StreamContent(fileStream);
            var provider = new FileExtensionContentTypeProvider();

            string contentType;
            if (!provider.TryGetContentType(filePath, out contentType)) {
                contentType = "application/octet-stream";
            }
            streamContent.Headers.ContentType = new MediaTypeHeaderValue(contentType);

            content.Add(streamContent, "file", Path.GetFileName(filePath));

            var response = await _httpClient.PostAsync("fileattachment/upload/file", content);
            response.EnsureSuccessStatusCode();

            return await response.Content.ReadFromJsonAsync<int>();
        }

        public async Task<FileAttachmentURLDTO> GetFileURL(int fileID) {
            var response = await _httpClient.GetAsync($"fileattachment/get/file/{fileID}");

            return await response.Content.ReadFromJsonAsync<FileAttachmentURLDTO>();
        }
    }
} //END NAMESPACE EmailApplication.Client.APIServices
//==============================================================================
//==============================================================================