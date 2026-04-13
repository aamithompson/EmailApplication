//==============================================================================
// Filename: FileViewModel.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 3/10/2026
//
// Description: View Model for a files. Does not contain the file, but the link.
//==============================================================================
namespace EmailApplication.Client.ViewModel {
    public class FileViewModel {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public string FileName { get; set; }
        public int Size { get; set; }
        public DateTime DateUploaded { get; set; }
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================