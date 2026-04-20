using System.Windows;
using System.Windows.Controls;
using EmailApplication.Client;
using EmailApplication.Client.APIServices;
using EmailApplication.Client.ViewModel;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for InboxControl.xaml
    /// </summary>
    public partial class InboxControl : UserControl {
        private readonly MainWindow _mainWindow;
        private readonly Session _session;
        private readonly IEmailAPIService _emailAPIService;
        private readonly InboxCache _inboxCache;
        private InboxViewModel _inbox;

        public InboxControl(MainWindow mainWindow, Session session, IEmailAPIService emailAPIService, InboxCache inboxCache) {
            InitializeComponent();
            _mainWindow = mainWindow;
            _session = session;
            _emailAPIService = emailAPIService;
            _inboxCache = inboxCache;
            _inbox = new InboxViewModel();

            this.DataContext = _inbox;
            RefreshInbox();
        }

        private async void RefreshInbox() {
            bool success = await _inboxCache.RefreshInbox();

            if(success) {
                _inbox.Emails.Clear();
                int n = _inboxCache.InboxVMCache.Emails.Count;
                for(int i = 0; i < n; i++) {
                    _inbox.Emails.Add(new InboxEmailViewModel {
                        MailID = _inboxCache.InboxVMCache.Emails[i].MailID,
                        Sender = _inboxCache.InboxVMCache.Emails[i].Sender,
                        Subject = _inboxCache.InboxVMCache.Emails[i].Subject,
                        Preview = _inboxCache.InboxVMCache.Emails[i].Preview,
                        DateReceived = _inboxCache.InboxVMCache.Emails[i].DateReceived,
                        IsRead = _inboxCache.InboxVMCache.Emails[i].IsRead
                    });
                }
            }
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
