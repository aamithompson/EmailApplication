using EmailApplication.Client.APIServices;
using EmailApplication.Client.ViewModel;
using EmailApplication.Client.Mapper;
using System.Windows;
using System.Windows.Controls;
using EmailApplication.Shared;
using EmailApplication.Enums;
using System.Net.Http;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for AccountLoginUserControl.xaml
    /// </summary>
    public partial class AccountLoginUserControl : UserControl {
        private readonly MainWindow _mainWindow;
        private readonly IAccountAPIService _accountAPIService;
        private bool displayFailedLogin = false;
        private bool displayConnectionFailure = false;

        public AccountLoginUserControl(MainWindow mainWindow, IAccountAPIService accountAPIService) {
            InitializeComponent();
            _mainWindow = mainWindow;
            _accountAPIService = accountAPIService;
        }

        private async void SignIn_Click(object sender, RoutedEventArgs e) {
            displayFailedLogin = false;
            displayConnectionFailure = false;

            LoginViewModel loginViewModel = new LoginViewModel {
                EmailAddress = EmailAddressTextBox.Text,
                Password = PasswordTextBox.Password
            };

            try {
                LoginResponseDTO result = await _accountAPIService.Login(AccountMapper.LoginViewMailToSendAccountLoginDTO(loginViewModel));
                if(result.Response == LoginResponse.Successful) {
                    _mainWindow.ShowInbox();
                } else {
                    displayFailedLogin = true;
                    return;
                }
            } catch (HttpRequestException) {
                //Server Not Reached
                displayConnectionFailure = true;
            } catch (Exception ex) {
                //Unexpected Error
                displayConnectionFailure = true;
            }
        }

        private void CreateNewAccountButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.CreateAccount();
        }
    }
}
