using EmailApplication.Client.ViewModel;
using System.Windows;
using System.Windows.Controls;
using EmailApplication.Client.APIServices;
using EmailApplication.Client;
using EmailApplication.Client.Mapper;
using System.Net.Http;
using System.Collections.ObjectModel;
using Microsoft.WindowsAPICodePack.Dialogs;
using System.IO;
using EmailApplication.Shared;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for CreateMail.xaml
    /// </summary>
    public partial class CreateMailControl : UserControl {
        private readonly MainWindow _mainWindow;
        private readonly IEmailAPIService _emailAPIService;
        private readonly IFileAPIService _fileAPIService;

        public CreateMailControl(MainWindow mainWindow, Session session, IEmailAPIService emailAPIService, IFileAPIService fileAPIService) {
            InitializeComponent();
            _mainWindow = mainWindow;
            _emailAPIService = emailAPIService;
            _fileAPIService = fileAPIService;

            this.DataContext = new CreateMailViewModel() {
                Subject = null,
                Recipients = null,
                Body = null,
                Sender = session.EmailAddress,
                FileAttachments = new ObservableCollection<FileAttachmentViewModel>()
            };
        }

        private void BackButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.ShowInbox();
        }

        private async void SendButton_Click(object sender, RoutedEventArgs e) {
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

        private async void FileAttach_Click(object sender, RoutedEventArgs e) {
            var dialog = new CommonOpenFileDialog {
                Multiselect = true
            };

            if(dialog.ShowDialog() != CommonFileDialogResult.Ok) {
                return;
            }

            var vm = (CreateMailViewModel)this.DataContext;

            foreach(string filePath in dialog.FileNames) {
                var attachment = new FileAttachmentViewModel {
                    FileName = Path.GetFileName(filePath),
                    FileID = 0,
                    IsUploading = true
                };

                vm.FileAttachments.Add(attachment);

                try {
                    int fileID = await _fileAPIService.UploadFile(filePath);
                    attachment.FileID = fileID;
                    attachment.IsUploading = false;
                } catch {
                    vm.FileAttachments.Remove(attachment);
                }
            }

        }

        private async void DownloadAttachment_Click(object sender, RoutedEventArgs e) {
            var attachment = (FileAttachmentViewModel)((Button)sender).DataContext;
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

        private void RemoveAttachment_Click(object sender, RoutedEventArgs e) {
            var attachment = (FileAttachmentViewModel)((Button)sender).DataContext;
            var vm = (CreateMailViewModel)DataContext;
            vm.FileAttachments.Remove(attachment);
        }
    }
}