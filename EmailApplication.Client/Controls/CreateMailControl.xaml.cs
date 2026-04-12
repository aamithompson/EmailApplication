using EmailApplication.Client.ViewModel;
using System.Windows;
using System.Windows.Controls;
using EmailApplication.Client.APIServices;
using EmailApplication.Client;
using EmailApplication.Client.Mapper;
using System.Net.Http;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for CreateMail.xaml
    /// </summary>
    public partial class CreateMailControl : UserControl {
        private readonly MainWindow _mainWindow;
        private readonly IEmailAPIService _emailAPIService;

        public CreateMailControl(MainWindow mainWindow, Session session, IEmailAPIService emailAPIService) {
            InitializeComponent();
            _mainWindow = mainWindow;
            _emailAPIService = emailAPIService;

            this.DataContext = new CreateMailViewModel() {
                Subject = null,
                Recipients = null,
                Body = null,
                Sender = session.EmailAddress
            };
        }

        private void BackButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.ShowInbox();
        }

        private async void SendButton_Click(Object sender, RoutedEventArgs e) {
            CreateMailViewModel createMailViewModel = (CreateMailViewModel) this.DataContext;

            try {
                bool success = await _emailAPIService.SendEmail(EmailMapper.CreateMailViewModelToSendEmailDTO(createMailViewModel));
                if(success) {
                    _mainWindow.ShowInbox();
                }
            } catch (HttpRequestException) {

            } catch (Exception ex) {

            }

            _mainWindow.ShowInbox();
        }
    }
}