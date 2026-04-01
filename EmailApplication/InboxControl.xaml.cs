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
using EmailApplication.ViewModel;
using EmailApplication.Repositories;
using EmailApplication.Services;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for InboxControl.xaml
    /// </summary>
    public partial class InboxControl : UserControl {
        private MainWindow _mainWindow;

        public InboxControl(MainWindow mainWindow) {
            InitializeComponent();
            _mainWindow = mainWindow;

            EmailService service = new EmailService(
                new EmailRepository(),
                new AccountRepository(),
                new EmailToReceiverRepository(),
                new InboxEmailRepository()
            );

            this.DataContext = new InboxViewModel() {
                Emails = service.GetInboxEmailViewModels(SessionOld.AccountID)
            };
        }

        private void InboxList_SelectionChanged(object sender, SelectionChangedEventArgs e) {
            if(e.AddedItems.Count == 0) {
                return;
            }

            if(e.AddedItems[0] is InboxEmailViewModel selected) {
                _mainWindow.ViewMail(selected.MailID);
            }
        }

        private void CreateMailButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.CreateMail();
        } 
    }
}
