//==============================================================================
// Filename: AccountMapper.cs
// Author: Aaron Thompson
// Date Created: 4/6/2026
// Last Updated: 4/9/2026
//
// Description: Translation of account DTOs and VMs both ways. Implemented as a
// static class.
//==============================================================================
using EmailApplication.Client.ViewModel;
using EmailApplication.Shared;
//------------------------------------------------------------------------------
namespace EmailApplication.Client.Mapper {
    public static class AccountMapper {
        public static CreateAccountDTO AccountCreationViewModelToCreateAccountDTO(AccountCreationViewModel vm) {
            return new CreateAccountDTO {
                EmailAddress = vm.EmailAddress,
                AccountName = vm.AccountName,
                Password = vm.Password
            };
        }

        public static SendAccountLoginDTO LoginViewMailToSendAccountLoginDTO(LoginViewModel vm) {
            return new SendAccountLoginDTO {
                EmailAddress = vm.EmailAddress,
                Password = vm.Password
            };
        }
    }
} //END NAMESPACE EmailApplication.Client.Mapper
//==============================================================================
//==============================================================================