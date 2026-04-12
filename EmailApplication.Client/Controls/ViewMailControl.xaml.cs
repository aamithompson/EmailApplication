using EmailApplication.Client.ViewModel;
using System.Windows;
using System.Windows.Controls;
using EmailApplication.Client;
using EmailApplication.Client.APIServices;
using EmailApplication.Client.Mapper;
using System.Net.Http;
using EmailApplication.Shared;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for ViewMailControl.xaml
    /// </summary>
    public partial class ViewMailControl : UserControl {
        private readonly MainWindow _mainWindow;
        private readonly Session _session;
        private readonly IEmailAPIService _emailAPIService;
        private EmailViewModel _mail;

        public ViewMailControl(MainWindow mainWindow, Session session, IEmailAPIService emailAPIService, int mailID) {
            InitializeComponent();
            _mainWindow = mainWindow;
            _session = session;
            _emailAPIService = emailAPIService;
            _mail = new EmailViewModel();

            this.DataContext = _mail;
            RefreshMail(mailID);
        }

        private async void RefreshMail(int mailID) {
            try {
                EmailDTO dto = await _emailAPIService.GetEmail(mailID);
                EmailMapper.PopulateEmailViewModelFromEmailDTO(dto, _mail);
            } catch (HttpRequestException) {

            } catch (Exception ex) {

            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.ShowInbox();
        }
    }
}
