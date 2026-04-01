using EmailApplication.Data;
using Microsoft.Data.SqlClient;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace EmailApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window {
        public MainWindow() {
            InitializeComponent();
            TestDatabaseConnection();

            Login();
        }

        public void Login() {
            MainContent.Content = new AccountLoginUserControl(this);
        }

        public void CreateAccount() {
            MainContent.Content = new AccountCreationUserControl(this);
        }

        public void ShowInbox() {
            if(!SessionOld.ValidateSession()) {
                return;
            }

            MainContent.Content = new InboxControl(this);
        }

        public void ViewMail(int mailID) {
            if(!SessionOld.ValidateSession()) {
                return;
            }

            MainContent.Content = new ViewMailControl(this, mailID);
        }

        public void CreateMail() {
            if(!SessionOld.ValidateSession()) {
                return;
            }

            MainContent.Content = new CreateMailControl(this);
        }

        private void TestDatabaseConnection() {
            try {
                using (SqlConnection connection = DatabaseConnection.GetConnection()) {
                    connection.Open();
                    MessageBox.Show("Database connected successfully!", "Connection Test",
                                  MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex) {
                MessageBox.Show($"Connection failed: {ex.Message}", "Connection Test",
                               MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}