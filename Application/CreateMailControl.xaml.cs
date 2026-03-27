using EmailApplication.Repositories;
using EmailApplication.Services;
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
    /// Interaction logic for CreateMail.xaml
    /// </summary>
    public partial class CreateMailControl : UserControl {
        private MainWindow _mainWindow;

        public CreateMailControl(MainWindow mainWindow) {
            InitializeComponent();
            _mainWindow = mainWindow;
            AccountService accountService = new AccountService(
                new AccountRepository()
            );

            AccountNameViewModel accountNameViewModel = accountService.GetAccountNameViewModel(Session.AccountID);
            this.DataContext = new CreateMailViewModel() {
                Subject = null,
                Recipients = null,
                Body = null,
                Sender = (accountNameViewModel != null) ? accountService.GetAccountNameViewModel(Session.AccountID).Name : null
            };
        }

        private void BackButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.ShowInbox();
        }

        private void SendButton_Click(Object sender, RoutedEventArgs e) {
            EmailService emailService = new EmailService(
                new EmailRepository(),
                new AccountRepository(),
                new EmailToReceiverRepository(),
                new InboxEmailRepository()
            );

            CreateMailViewModel createMailViewModel = (CreateMailViewModel) this.DataContext;
            emailService.SendEmail(createMailViewModel.Subject, Session.AccountID, createMailViewModel.Recipients, createMailViewModel.Body);

            _mainWindow.ShowInbox();
        }
    }
}