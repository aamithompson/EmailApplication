using EmailApplication.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for AccountCreationUserControl.xaml
    /// </summary>
    public partial class AccountCreationUserControl : UserControl {
        private MainWindow _mainWindow;
        public AccountCreationUserControl(MainWindow mainWindow) {
            InitializeComponent();
            _mainWindow = mainWindow;

            this.DataContext = new AccountCreationViewModel {
                EmailAddress = null,
                AccountName = null,
                Password = null
            };
        }

        private void CreateAccountButton_Click(object sender, RoutedEventArgs e) {
            AccountService accountService = new AccountService(
                new AccountRepository()
            );

            AccountCreationViewModel accountCreationViewModel = (AccountCreationViewModel) this.DataContext;
            accountCreationViewModel.Password = PasswordTextBox.Password;

            bool accountCreationSuccess = accountService.CreateAccount(accountCreationViewModel.EmailAddress, accountCreationViewModel.AccountName, accountCreationViewModel.Password);
            
            if(accountCreationSuccess) {
                _mainWindow.Login();
            }

        }

        private void SignInButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.Login();
        }
    }
}
