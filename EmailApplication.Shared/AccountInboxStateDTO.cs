//==============================================================================
// Filename: AccountDTO.cs
// Author: Aaron Thompson
// Date Created: 4/20/2026
// Last Updated: 4/20/2026
//
// Description: Data transfer object (DTO) for inbox status information.
//==============================================================================
namespace EmailApplication.Shared {

// VARIABLE(s)
//------------------------------------------------------------------------------
    public class AccountInboxStateDTO {
        public int StateID { get; set; }
        public int AccountID { get; set; }
        public int Category { get; set; }
        public int MailCount { get; set; }
        public DateTime DateLastModified { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================