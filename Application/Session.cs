using EmailApplication.Data;
using EmailApplication.Repositories;

namespace EmailApplication {
    public static class Session {
        //Should be placed in a config or environment variable, but for practical purposes is here.
        //Do not place actual sensitive information in this application.
        private static readonly string _secretKey = "SecretKey";

        private static string _sessionToken;
        public static int AccountID { get; set; }
        public static string  AccountName { get; private set; }
        public static string EmailAddress { get; private set; }
        public static bool IsAuthenticated { get; private set; }

        public static bool Login(string emailAddress, string password) {
            AccountRepository accountRepository = new AccountRepository();
            AccountData accountData = accountRepository.GetAccountDataByEmailAddress(emailAddress);

            if(accountData == null) {
                return false;
            }

            if(!BCrypt.Net.BCrypt.Verify(password, accountData.PasswordHash)) {
                return false;
            }

            _sessionToken = GenerateToken(accountData.AccountID, accountData.AccountName, accountData.EmailAddress);
            AccountID = accountData.AccountID;
            AccountName = accountData.AccountName;
            EmailAddress = accountData.EmailAddress;
            IsAuthenticated = true;
            return true;
        }

        public static void Logout() {
            _sessionToken = null;
            AccountID = 0;
            AccountName = null;
            EmailAddress = null;
            IsAuthenticated = false;
        }

        public static bool ValidateSession() {
            if(!IsAuthenticated) {
                return false;
            }

            if(_sessionToken != GenerateToken(AccountID, AccountName, EmailAddress)){ 
                return false;
            }

            return true;
        }

        private static string GenerateToken(int accountID, string accountName, string emailAddress) {
            return Convert.ToBase64String(System.Security.Cryptography.SHA256.HashData(
                System.Text.Encoding.UTF8.GetBytes($"{accountID}{accountName}{emailAddress}{_secretKey}")));
        }
    }
}