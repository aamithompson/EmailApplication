//==============================================================================
// Filename: FileAttachmentToEmailData.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 4/29/2026
//
// Description: Data object for database access
//==============================================================================
namespace EmailApplication.Server.Data {
    public class FileAttachmentToEmailData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int FileID {  get; set; } //FOREIGN KEY
        public int MailID {  get; set; } //FOREIGN KEY
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================