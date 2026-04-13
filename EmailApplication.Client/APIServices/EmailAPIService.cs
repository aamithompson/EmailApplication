//==============================================================================
// Filename: EmailAPIService.cs
// Author: Aaron Thompson
// Date Created: 4/2/2026
// Last Updated: 4/10/2026
//
// Description: API Service regarding emails which handles making requests to
// the server and retrieving the results for the client side.
// GET  GetEmail(mailID) -> "api/email/get/email/{mailID}"
// GET  GetInbox() -> "api/email/get/inbox"
// POST SendEmail(dto) -> "api/email/send/email"
//==============================================================================
using EmailApplication.Shared;
using System.Net.Http;
using System.Net.Http.Json;
//------------------------------------------------------------------------------
namespace EmailApplication.Client.APIServices {
    public interface IEmailAPIService {
        Task<EmailDTO> GetEmail(int mailID);
        Task<List<InboxEmailDTO>> GetInbox();
        Task<bool> SendEmail(SendEmailDTO dto);
    }

    public class EmailAPIService : IEmailAPIService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly HttpClient _httpClient;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public EmailAPIService(HttpClient httpClient) {
            _httpClient = httpClient;
        }

// REQUEST(s)/RESPONSE(s)
//------------------------------------------------------------------------------
        public async Task<EmailDTO> GetEmail(int mailID) {
            var response = await _httpClient.GetAsync($"email/get/email/{mailID}");

            return await response.Content.ReadFromJsonAsync<EmailDTO>();
        }

        public async Task<List<InboxEmailDTO>> GetInbox() {
            var response = await _httpClient.GetAsync("email/get/inbox");

            System.Diagnostics.Debug.WriteLine($"Status: {response.StatusCode}");
            System.Diagnostics.Debug.WriteLine($"URL: {response.RequestMessage.RequestUri}");
            System.Diagnostics.Debug.WriteLine($"Header: {response.RequestMessage.Headers}");
            System.Diagnostics.Debug.WriteLine($"Content: {response.RequestMessage.Content}");

            return await response.Content.ReadFromJsonAsync<List<InboxEmailDTO>>();
        }

        public async Task<bool> SendEmail(SendEmailDTO dto) {
            var response = await _httpClient.PostAsJsonAsync("email/send/email", dto);

            return response.IsSuccessStatusCode;
        }
    }
} //END NAMESPACE EmailApplication.Client.APIServices
//==============================================================================
//==============================================================================