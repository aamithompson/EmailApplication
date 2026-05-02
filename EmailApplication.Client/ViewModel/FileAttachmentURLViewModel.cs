//==============================================================================
// Filename: FileAttachmentURLViewModel.cs
// Author: Aaron Thompson
// Date Created: 5/2/2026
// Last Updated: 5/2/2026
//
// Description: View Model for file download to input into.
//==============================================================================
using System.Runtime.InteropServices.JavaScript;

namespace EmailApplication.Client.ViewModel {
    public class FileAttachmentURLViewModel : ViewModelBase {
        public int FileID { get; set; }

        public string FileName { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Repositories
//==============================================================================
//==============================================================================