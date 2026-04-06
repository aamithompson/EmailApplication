using EmailApplication.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;

namespace EmailApplication.Client.APIServices {
    public interface IEmailAPIService {
        Task<EmailDTO> GetEmail(int mailID);
        Task<List<InboxEmailDTO>> GetInbox(GetInboxDTO dto);
        Task<bool> SendEmail(SendEmailDTO dto);
    }

    public class EmailAPIService : IEmailAPIService {
        private readonly HttpClient _httpClient;

        public EmailAPIService(HttpClient httpClient) {
            _httpClient = httpClient;
        }

        public async Task<EmailDTO> GetEmail(int mailID) {
            var response = await _httpClient.GetAsync($"email/get/email/{mailID}");

            return await response.Content.ReadFromJsonAsync<EmailDTO>();
        }

        public async Task<List<InboxEmailDTO>> GetInbox(GetInboxDTO dto) {
            //A GET operation, but using POST as the dto allows for easy complex querying.
            var response = await _httpClient.PostAsJsonAsync("email/get/inbox", dto);

            return await response.Content.ReadFromJsonAsync<List<InboxEmailDTO>>();
        }

        public async Task<bool> SendEmail(SendEmailDTO dto) {
            var response = await _httpClient.PostAsJsonAsync("email/send/email", dto);

            return response.IsSuccessStatusCode;
        }
    }
}
