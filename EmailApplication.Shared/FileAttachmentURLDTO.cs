//==============================================================================
// Filename: FileAttachmentURLDTO.cs
// Author: Aaron Thompson
// Date Created: 5/1/2026
// Last Updated: 5/1/2026
//
// Description: Data transfer object (DTO) for url for the file in S3 storage
// being sent to client after query.
//==============================================================================
namespace EmailApplication.Shared {
    public class FileAttachmentURLDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public string URL { get; set; }
        public float ExpiryMinutes { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================
