using EmailApplication.Client.ViewModel;
using System.Windows;
using System.Windows.Controls;
using EmailApplication.Client;
using EmailApplication.Client.APIServices;
using EmailApplication.Client.Mapper;
using System.Net.Http;
using EmailApplication.Shared;
using Microsoft.WindowsAPICodePack.Dialogs;
using System.IO;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for ViewMailControl.xaml
    /// </summary>
    public partial class ViewMailControl : UserControl {
        private readonly MainWindow _mainWindow;
        private readonly Session _session;
        private readonly IEmailAPIService _emailAPIService;
        private readonly IFileAPIService _fileAPIService;
        private EmailViewModel _mail;

        public ViewMailControl(MainWindow mainWindow, Session session, IEmailAPIService emailAPIService, IFileAPIService fileAPIService, int mailID) {
            InitializeComponent();
            _mainWindow = mainWindow;
            _session = session;
            _emailAPIService = emailAPIService;
            _fileAPIService = fileAPIService;
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

        private async void DownloadAttachment_Click(object sender, RoutedEventArgs e) {
            var attachment = (FileAttachmentURLViewModel)((Button)sender).DataContext;
            var dialog = new CommonSaveFileDialog {
                DefaultFileName = attachment.FileName,
                DefaultExtension = Path.GetExtension(attachment.FileName).TrimStart('.'),
                Filters = { new CommonFileDialogFilter("All Files", "*.*") }
            };

            if(dialog.ShowDialog() != CommonFileDialogResult.Ok) {
                return;
            }

            string filePath = dialog.FileName;

            FileAttachmentURLDTO dto = await _fileAPIService.GetFileURL(attachment.FileID);
            string url = dto.URL;
            using var httpClient = new HttpClient();
            var bytes = await httpClient.GetByteArrayAsync(url);
            await File.WriteAllBytesAsync(filePath, bytes);
        }

        private void BackButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.ShowInbox();
        }
    }
}
