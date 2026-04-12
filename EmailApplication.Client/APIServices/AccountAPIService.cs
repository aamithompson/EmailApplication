//==============================================================================
// Filename: AccountAPIService.cs
// Author: Aaron Thompson
// Date Created: 4/2/2026
// Last Updated: 4/10/2026
//
// Description: API Service regarding accounts which handles making requests to
// the server and retrieving the results for the client side.
// GET  GetAccount(accountID) -> "api/account/get/account/{accountID}"
// POST Login(dto) -> "api/account/login"
// POST CreateAccount(dto) -> "api/account/create"
//==============================================================================
using EmailApplication.Shared;
using EmailApplication.Enums;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Net.Http;
//------------------------------------------------------------------------------
namespace EmailApplication.Client.APIServices {
    public interface IAccountAPIService {
        Task<AccountDTO> GetAccount(int accountID);
        Task<LoginResponseDTO> Login(SendAccountLoginDTO dto);
        Task<CreateAccountResponseDTO> CreateAccount(CreateAccountDTO dto);
    }

    public class AccountAPIService : IAccountAPIService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly HttpClient _httpClient;
        private readonly Session _session;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public AccountAPIService(HttpClient httpClient, Session session) {
            _httpClient = httpClient;
            _session = session;
        }

// REQUEST(s)/RESPONSE(s)
//------------------------------------------------------------------------------
        public async Task<AccountDTO> GetAccount(int accountID) {
            var response = await _httpClient.GetAsync($"account/get/account/{accountID}");

            return await response.Content.ReadFromJsonAsync<AccountDTO>();
        }

        public async Task<LoginResponseDTO> Login(SendAccountLoginDTO dto) {
            var response = await _httpClient.PostAsJsonAsync("account/login", dto);
            var result = await response.Content.ReadFromJsonAsync<LoginResponseDTO>();

            //TODO: Handle null case possibly later?
            if(result.Response == LoginResponse.Successful) {
                _session.Token = result.Token;
                _session.AccountName = result.AccountName;
                _session.EmailAddress = result.EmailAddress;

                //Token Attachment for Future Requests
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", result.Token);

                System.Diagnostics.Debug.WriteLine($"Token set: {result.Token}");
                System.Diagnostics.Debug.WriteLine($"Auth header: {_httpClient.DefaultRequestHeaders.Authorization}");
            }

            return result;
        }

        public async Task<CreateAccountResponseDTO> CreateAccount(CreateAccountDTO dto) {
            var response = await _httpClient.PostAsJsonAsync("account/create", dto);

            //TODO: Handle null case possibly later?
            return await response.Content.ReadFromJsonAsync<CreateAccountResponseDTO>();
        }
    }
} //END NAMESPACE EmailApplication.Client.APIServices
//==============================================================================
//==============================================================================