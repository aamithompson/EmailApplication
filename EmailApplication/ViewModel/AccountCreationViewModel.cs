using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.ViewModel{
    public class AccountCreationViewModel : ViewModelBase {
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
}
