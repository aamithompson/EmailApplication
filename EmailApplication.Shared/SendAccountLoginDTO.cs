//==============================================================================
// Filename: SendAccountLoginDTO.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 3/31/2026
//
// Description: Data transfer object (DTO) for when users send account login
// creditials from the client to server.
//==============================================================================
namespace EmailApplication.Shared {
    public class SendAccountLoginDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public string EmailAddress { get; set; }
        public string Password { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================