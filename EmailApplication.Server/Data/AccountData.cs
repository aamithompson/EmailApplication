//==============================================================================
// Filename: AccountData.cs
// Author: Aaron Thompson
// Date Created: 3/12/2026
// Last Updated: 3/30/2026
//
// Description: Data object for database access
//==============================================================================
namespace EmailApplication.Server.Data {
    public class AccountData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int AccountID { get; set; } //PRIMARY KEY
        public string EmailAddress { get; set; }
        public string AccountName { get; set; }
        public string PasswordHash { get; set; } //Stored as algorithm$salt$hash
        public DateTime DateCreated { get; set; }
        public DateTime DateLastLogin { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================