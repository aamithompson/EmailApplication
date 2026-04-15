//==============================================================================
// Filename: Session.cs
// Author: Aaron Thompson
// Date Created: 3/31/2026
// Last Updated: 3/31/2026
//
// Description: Holds client relevant information for client side to access
// after the user has logged in.
//==============================================================================
namespace EmailApplication.Client {
    public class Session {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int AccountID { get; set; }
        public string AccountName { get; set; }
        public string EmailAddress { get; set; }
        public string Token { get; set; }
        public bool IsAuthenticated => !string.IsNullOrEmpty(Token);
    }
} //END NAMESPACE EmailApplication.Client
//==============================================================================
//==============================================================================