//==============================================================================
// Filename: InboxEmailDTO.cs
// Author: Aaron Thompson
// Date Created: 4/1/2026
// Last Updated: 4/9/2026
//
// Description: Data transfer object (DTO) for individual preview emails in the
// inbox when user requests their inbox it is sent from the server to client.
//==============================================================================
namespace EmailApplication.Shared {
    public class InboxEmailDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int MailID { get; set; }
        public string Sender { get; set; }
        public string Subject { get; set; }
        public string Preview { get; set; }
        public DateTime? DateReceived { get; set; }
        public DateTime? DateRead { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================