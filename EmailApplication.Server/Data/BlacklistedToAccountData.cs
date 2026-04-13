//==============================================================================
// Filename: BlacklistedToAccountData.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 3/30/2026
//
// Description: Data object for database access
//==============================================================================
namespace EmailApplication.Server.Data {
    public class BlacklistedToAccountData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int BlacklistFrom { get; set; } //FOREIGN KEY
        public int BlacklistTo { get; set; } //FOREIGN KEY
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================