using EmailApplication.Client;
using EmailApplication.Client.APIServices;
using System.Windows;

namespace EmailApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window {
        private readonly Session _session;
        private readonly IAccountAPIService _accountAPIService;
        private readonly IEmailAPIService _emailAPIService;

        public MainWindow(Session session, IAccountAPIService accountAPIService, IEmailAPIService emailAPIService) {
            _session = session;
            _accountAPIService = accountAPIService;
            _emailAPIService = emailAPIService;
            InitializeComponent();
            Login();
        }

        public void Login() {
            MainContent.Content = new AccountLoginUserControl(this, _accountAPIService);
        }

        public void CreateAccount() {
            MainContent.Content = new AccountCreationUserControl(this, _accountAPIService);
        }

        public void ShowInbox() {
            MainContent.Content = new InboxControl(this, _session, _emailAPIService);
        }

        public void ViewMail(int mailID) {
            MainContent.Content = new ViewMailControl(this, _session, _emailAPIService, mailID);
        }

        public void CreateMail() {
            MainContent.Content = new CreateMailControl(this, _session, _emailAPIService);
        }
    }
}