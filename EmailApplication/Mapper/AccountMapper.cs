using EmailApplication.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;
using EmailApplication.Shared;

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
}
