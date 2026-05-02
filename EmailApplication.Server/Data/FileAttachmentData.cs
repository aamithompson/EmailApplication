//==============================================================================
// Filename: FileAttachmentData.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 4/30/2026
//
// Description: Data object for database access. UploaderID here exists to
// to prevent users from swapping the FileID(s) on attachments on client side to
// potentially get access to files that are not theirs. Since the process is
// first uploading the file before the mail is ever sent, this allows a period of
// time for users to inject a different FileID.
//==============================================================================
namespace EmailApplication.Server.Data {
    public class FileAttachmentData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int FileID { get; set; } //PRIMARY KEY
        public string BucketKey { get; set; } //REFERENCES AWS S3 object key, format: attachments/{FileID}/{FileName}
        public int UploaderID { get; set; } //FOREIGN KEY, here for security reasons, see above for explanation.
        public string FileName { get; set; }
        public long FileSize { get; set; }
        public DateTime DateUploaded { get; set; }
        public DateTime DateLastReferenced { get; set;  }
        public int ReferenceCount { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================