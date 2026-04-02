using EmailApplication.Shared;
using EmailApplication.Enums;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Net.Http;

namespace EmailApplication.Client.APIServices {
    public interface IAccountAPIService {
        Task<AccountDTO> GetAccount(int accountID);
        Task<LoginResponseDTO> Login(SendAccountLoginDTO dto);
        Task<CreateAccountResponseDTO> CreateAccount(CreateAccountDTO dto);
    }

    public class AccountAPIService : IAccountAPIService {
        private readonly HttpClient _httpClient;
        private readonly Session _session;

        public AccountAPIService(HttpClient httpClient, Session session) {
            _httpClient = httpClient;
            _session = session;
        }

        public async Task<AccountDTO> GetAccount(int accountID) {
            var response = await _httpClient.GetAsync($"account/get/account/{accountID}");

            return await response.Content.ReadFromJsonAsync<AccountDTO>();
        }

        public async Task<LoginResponseDTO> Login(SendAccountLoginDTO dto) {
            var response = await _httpClient.PostAsJsonAsync("account/login", dto);
            var result = await response.Content.ReadFromJsonAsync<LoginResponseDTO>();

            //TODO: Handle null case possibly later?
            if(result.Response == LoginResponse.Succesful) {
                _session.Token = result.Token;
                _session.AccountName = result.AccountName;
                _session.EmailAddress = result.EmailAddress;

                //Token Attachment for Future Requests
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", result.Token);
            }

            return result;
        }

        public async Task<CreateAccountResponseDTO> CreateAccount(CreateAccountDTO dto) {
            var response = await _httpClient.PostAsJsonAsync("account/create", dto);

            //TODO: Handle null case possibly later?
            return await response.Content.ReadFromJsonAsync<CreateAccountResponseDTO>();
        }
    }
}
