using EmailApplication.Data;
using EmailApplication.ViewModel;
using EmailApplication.Repositories;

namespace EmailApplication.Services {
    public interface IAccountService {
        AccountProfileViewModel GetAccountProfileViewModel(int accountID);
        AccountNameViewModel GetAccountNameViewModel(int accountID);
    }

    public class AccountService : IAccountService {
        private readonly IAccountRepository _accountRepository;

        public AccountService(IAccountRepository accountRepository) {
            _accountRepository = accountRepository;
        }

        public AccountProfileViewModel GetAccountProfileViewModel(int accountID) {
            AccountData accountData = _accountRepository.GetAccountDataByID(accountID);
            if(accountData == null) {
                return null;
            }

            return new AccountProfileViewModel {
                EmailAddress = accountData.EmailAddress,
                Name = accountData.AccountName,
                DateCreated = accountData.DateCreated,
                DateLastLogin = accountData.DateLastLogin
            };
        }

        public AccountNameViewModel GetAccountNameViewModel(int accountID) {
            AccountData accountData = _accountRepository.GetAccountDataByID(accountID);
            if(accountData == null) {
                return null;
            }

            return new AccountNameViewModel {
                Name = accountData.AccountName
            };
        }

        public bool CreateAccount(string emailAdress, string accountName, string password) {
            AccountData accountData = new AccountData {
                EmailAddress = emailAdress,
                AccountName = accountName,
                PasswordHash = BCrypt.Net.BCrypt.HashPassword(password),
                DateCreated = DateTime.Now,
                DateLastLogin = DateTime.Now
            };

            int accountID = _accountRepository.InsertAccount(accountData);
            if(accountID == 0) {
                return false;
            }

            return true;
        }
    }
}