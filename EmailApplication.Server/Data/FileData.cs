//==============================================================================
// Filename: FileData.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 3/10/2026
//
// Description: Data object for database access
//==============================================================================
namespace EmailApplication.Server.Data {
    public class FileData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int FileID { get; set; }
        public string FileLocation { get; set; }
        public int Size { get; set; }
        public DateTime DateUploaded { get; set; }
        public int ReferenceCount { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================