using System.Windows;
using System.Windows.Controls;
using EmailApplication.Client;
using EmailApplication.Client.APIServices;
using EmailApplication.Client.ViewModel;
using EmailApplication.Client.Mapper;
using EmailApplication.Shared;
using System.Net.Http;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for InboxControl.xaml
    /// </summary>
    public partial class InboxControl : UserControl {
        private readonly MainWindow _mainWindow;
        private readonly Session _session;
        private readonly IEmailAPIService _emailAPIService;
        private InboxViewModel _inbox;

        public InboxControl(MainWindow mainWindow, Session session, IEmailAPIService emailAPIService) {
            InitializeComponent();
            _mainWindow = mainWindow;
            _session = session;
            _emailAPIService = emailAPIService;
            _inbox = new InboxViewModel();

            this.DataContext = _inbox;
            RefreshInbox();
        }

        private async void RefreshInbox() {
            try {
                List<InboxEmailDTO> dtos = await _emailAPIService.GetInbox();
                if (dtos != null) {
                    _inbox.Emails.Clear();
                    for(int i = 0; i < dtos.Count; i++) {
                        _inbox.Emails.Add(new InboxEmailViewModel {
                            MailID = dtos[i].MailID,
                            Sender = dtos[i].Sender,
                            Subject = dtos[i].Subject,
                            Preview = dtos[i].Preview,
                            DateReceived = dtos[i].DateReceived,
                            IsRead = (dtos[i].DateRead != null)
                        });
                    }
                    /*List<InboxEmailViewModel> emails = new List<InboxEmailViewModel>();
                    for (int i = 0; i < dtos.Count; i++) {
                        emails.Add(new InboxEmailViewModel {
                            MailID = dtos[i].MailID,
                            Sender = dtos[i].Sender,
                            Subject = dtos[i].Subject,
                            Preview = dtos[i].Preview,
                            DateReceived = dtos[i].DateReceived,
                            IsRead = (dtos[i].DateRead != null)
                        });
                    }
                    _inbox = new InboxViewModel {
                        Emails = emails,
                        Search = ""
                    };*/
                }
            } catch (HttpRequestException) {

            } catch (Exception ex) {

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
