//==============================================================================
// Filename: AccountInboxStateData.cs
// Author: Aaron Thompson
// Date Created: 4/16/2026
// Last Updated: 4/16/2026
//
// Description: Data object for database access
//==============================================================================
namespace EmailApplication.Server.Data {
    public class AccountInboxStateData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int StateID { get; set; }
        public int AccountID { get; set; }
        public int Category { get; set; }
        public int MailCount { get; set; }
        public DateTime DateLastModified { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================