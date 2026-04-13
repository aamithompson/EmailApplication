//==============================================================================
// Filename: AccountCreationViewModel.cs
// Author: Aaron Thompson
// Date Created: 3/26/2026
// Last Updated: 4/9/2026
//
// Description: View Model for account creation to input into.
//==============================================================================
namespace EmailApplication.Client.ViewModel{
    public class AccountCreationViewModel : ViewModelBase {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private string _emailAdress;
        private string _accountName;

        public string EmailAddress { 
            get => _emailAdress;
            set {
                _emailAdress = value;
                OnPropertyChanged(nameof(EmailAddress));
            }
        }

        public string AccountName {
            get => _accountName;
            set {
                _accountName = value;
                OnPropertyChanged(nameof(AccountName));
            }
        }

        public string Password { get; set; }
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================
