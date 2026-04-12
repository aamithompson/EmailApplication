//==============================================================================
// Filename: LoginResponseDTO.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 3/30/2026
//
// Description: Data transfer object (DTO) for response given after login attmept
// and is given from the server to client.
//==============================================================================
using EmailApplication.Enums;
//------------------------------------------------------------------------------
namespace EmailApplication.Shared {
    public class LoginResponseDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public string Token { get; set; }
        public string AccountName { get; set; }
        public string EmailAddress { get; set; }
        public LoginResponse Response { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================