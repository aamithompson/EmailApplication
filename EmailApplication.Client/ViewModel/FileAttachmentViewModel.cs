//==============================================================================
// Filename: FileAttachmentViewModel.cs
// Author: Aaron Thompson
// Date Created: 5/2/2026
// Last Updated: 5/2/2026
//
// Description: View Model for file upload to input into.
//==============================================================================
using System.Runtime.InteropServices.JavaScript;

namespace EmailApplication.Client.ViewModel {
    public class FileAttachmentViewModel : ViewModelBase {
        private int _fileID;
        private bool _isUploading;

        public int FileID {
            get => _fileID; 
            set { 
                _fileID = value;
                OnPropertyChanged(nameof(FileID));
                OnPropertyChanged(nameof(IsUploaded));
            }
        }

        public string FileName { get; set; }
        public long FileSize { get; set; }

        public bool IsUploading { 
            get => _isUploading;
            set {
                _isUploading = value;
                OnPropertyChanged(nameof(IsUploading));
            }
        }

        public int UploadProgress { get; set; }
        public bool IsUploaded => FileID > 0;
    }
} //END NAMESPACE EmailApplication.Server.Repositories
//==============================================================================
//==============================================================================