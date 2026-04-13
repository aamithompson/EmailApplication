//==============================================================================
// Filename: AccountService.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 4/1/2026
//
// Description: Account services which handles packaging information from the
// repository and handles logic to prepare for JWT.
//==============================================================================
using EmailApplication.Server.Data;
using EmailApplication.Server.Repositories;
using EmailApplication.Shared;
using EmailApplication.Enums;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.IdentityModel.Tokens.Jwt;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Services {
    public interface IAccountService {
        AccountDTO GetAccount(int accountID);
        CreateAccountResponseDTO CreateAccount(CreateAccountDTO dto);
        LoginResponseDTO Login(SendAccountLoginDTO dto);
    }

    public class AccountService : IAccountService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IAccountRepository _accountRepository;
        private readonly IConfiguration _configuration;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public AccountService(IAccountRepository accountRepository, IConfiguration configuration) {
            _accountRepository = accountRepository;
            _configuration = configuration;
        }

// SERVICE FUNCTION(s)
//------------------------------------------------------------------------------
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

        public CreateAccountResponseDTO CreateAccount(CreateAccountDTO dto) {
            AccountData accountData = new AccountData {
                EmailAddress = dto.EmailAddress,
                AccountName = dto.AccountName,
                PasswordHash = BCrypt.Net.BCrypt.HashPassword(dto.Password),
                DateCreated = DateTime.Now,
                DateLastLogin = DateTime.Now
            };

            int accountID = _accountRepository.InsertAccount(accountData);
            if(accountID == 0) {
                return new CreateAccountResponseDTO { Response = AccountCreationResponse.AddressAlreadyExists };
            }

            return new CreateAccountResponseDTO {
                Response = AccountCreationResponse.Success
            };
        }

        public LoginResponseDTO Login(SendAccountLoginDTO dto) {
            //Finding Account
            AccountData account = _accountRepository.GetAccountDataByEmailAddress(dto.EmailAddress);

            if (account == null) {
                return new LoginResponseDTO() { Response = LoginResponse.NotFound };
            }

            //Verifying Password
            if (!BCrypt.Net.BCrypt.Verify(dto.Password, account.PasswordHash)) {
                return new LoginResponseDTO() { Response = LoginResponse.NotFound };
            }

            //JWT Token
            string token = GenerateToken(account);

            return new LoginResponseDTO {
                Token = token,
                AccountName = account.AccountName,
                EmailAddress = account.EmailAddress,
                Response = LoginResponse.Succesful
            };
        }

// JWT FUNCTION(s)
//------------------------------------------------------------------------------
        private string GenerateToken(AccountData account) {
            var claims = new[] {
                new Claim(ClaimTypes.NameIdentifier, account.AccountID.ToString()),
                new Claim(ClaimTypes.Email, account.EmailAddress),
                new Claim(ClaimTypes.Name, account.AccountName)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddHours(8),
                signingCredentials: credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
} //END NAMESPACE EmailApplication.Server.Services
//==============================================================================
//==============================================================================