using EmailApplication.Client;
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
        private readonly Session _session;
        public MainWindow(Session session) {
            _session = session;
            InitializeComponent();
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
    }
}