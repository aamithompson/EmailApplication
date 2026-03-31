using EmailApplication.Data;
using EmailApplication.Repositories;
using EmailApplication.Shared;
using EmailApplication.Enums;

namespace EmailApplication.Services {
    public interface IAccountService {
        AccountDTO GetAccount(int accountID);
        CreateAccountResponseDTO CreateAccount(CreateAccountDTO dto);
        LoginResponseDTO Login(SendAccountLoginDTO dto);
    }

    public class AccountService : IAccountService {
        private readonly IAccountRepository _accountRepository;

        public AccountService(IAccountRepository accountRepository) {
            _accountRepository = accountRepository;
        }

        public AccountDTO GetAccount(int accountID) {
            AccountData accountData = _accountRepository.GetAccountDataByID(accountID);
            if(accountData == null) {
                return null;
            }

            return new AccountDTO {
                AccountID = accountData.AccountID,
                EmailAddress = accountData.EmailAddress,
                AccountName = accountData.AccountName,
                DateCreated = accountData.DateCreated,
                DateLastLogin = accountData.DateLastLogin
            };
        }

        public CreateAccountResponseDTO CreateAccount(string emailAdress, string accountName, string password) {
            CreateAccountResponseDTO responseDTO = new CreateAccountResponseDTO() {
                Response = AccountCreationResponse.Success
            };

            AccountData accountData = new AccountData {
                EmailAddress = emailAdress,
                AccountName = accountName,
                PasswordHash = BCrypt.Net.BCrypt.HashPassword(password),
                DateCreated = DateTime.Now,
                DateLastLogin = DateTime.Now
            };

            int accountID = _accountRepository.InsertAccount(accountData);
            if(accountID == 0) {
                responseDTO.Response = AccountCreationResponse.AddressAlreadyExists;
                return responseDTO;
            }

            return responseDTO;
        }

        public LoginResponseDTO Login(SendAccountLoginDTO) {
            
        }
    }
}