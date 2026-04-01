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
    /// Interaction logic for AccountLoginUserControl.xaml
    /// </summary>
    public partial class AccountLoginUserControl : UserControl {
        private MainWindow _mainWindow;
        private bool displayFailedLogin = false;

        public AccountLoginUserControl(MainWindow mainWindow) {
            InitializeComponent();
            _mainWindow = mainWindow;
        }

        private void SignIn_Click(object sender, RoutedEventArgs e) {
            bool login = SessionOld.Login(EmailAddressTextBox.Text, PasswordTextBox.Password);
            if(!login) {
                displayFailedLogin = true;
                return;
            }
            
            _mainWindow.ShowInbox();
        }

        private void CreateNewAccountButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.CreateAccount();
        }
    }
}
