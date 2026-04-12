//==============================================================================
// Filename: SendEmailDTO.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 3/30/2026
//
// Description: Data transfer object (DTO) for individual preview emails in the
// inbox when user requests their inbox it is sent from the server to client.
//==============================================================================
namespace EmailApplication.Shared {
    public class SendEmailDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public string Subject { get; set; }
        public List<string> Recipients { get; set; }
        public string Body { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================