//==============================================================================
// Filename: FriendToAccountData.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 3/10/2026
//
// Description: Data object for database access
//==============================================================================
namespace EmailApplication.Server.Data {
    public class FriendToAccountData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int FriendFrom { get; set; } //FOREIGN KEY
        public int FriendTo { get; set; } //FOREIGN KEY
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================