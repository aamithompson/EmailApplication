using EmailApplication.Client.ViewModel;
using EmailApplication.Client.APIServices;
using EmailApplication.Client.Mapper;
using EmailApplication.Enums;
using System.Windows;
using System.Windows.Controls;
using EmailApplication.Shared;
using System.Net.Http;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for AccountCreationUserControl.xaml
    /// </summary>
    public partial class AccountCreationUserControl : UserControl {
        private readonly MainWindow _mainWindow;
        private readonly IAccountAPIService _accountAPIService;
        private bool displayFailedCreation = false;
        private bool displayConnectionFailure = false;

        public AccountCreationUserControl(MainWindow mainWindow, IAccountAPIService accountAPIService) {
            InitializeComponent();
            _mainWindow = mainWindow;
            _accountAPIService = accountAPIService;

            this.DataContext = new AccountCreationViewModel {
                EmailAddress = null,
                AccountName = null,
                Password = null
            };
        }

        private async void CreateAccountButton_Click(object sender, RoutedEventArgs e) {
            displayFailedCreation = false;
            displayConnectionFailure = false;
            AccountCreationViewModel accountCreationViewModel = (AccountCreationViewModel) this.DataContext;
            accountCreationViewModel.Password = PasswordTextBox.Password;

            try {
                CreateAccountResponseDTO result = await _accountAPIService.CreateAccount(AccountMapper.AccountCreationViewModelToCreateAccountDTO(accountCreationViewModel));
                if(result.Response == AccountCreationResponse.Success) {
                    _mainWindow.Login();
                } else {
                    displayFailedCreation = true;
                }
            } catch (HttpRequestException) {
                displayConnectionFailure = true;
            } catch (Exception ex) {
                displayConnectionFailure = true;
            }
        }

        private void SignInButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.Login();
        }
    }
}
