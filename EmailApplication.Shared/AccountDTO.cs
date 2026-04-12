//==============================================================================
// Filename: AccountDTO.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 3/31/2026
//
// Description: Data transfer object (DTO) for account information being sent to
// client after query.
//==============================================================================
namespace EmailApplication.Shared {
    public class AccountDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int AccountID { get; set; }
        public string EmailAddress { get; set; }
        public string AccountName { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateLastLogin { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================
