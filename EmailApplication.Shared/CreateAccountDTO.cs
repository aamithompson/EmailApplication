//==============================================================================
// Filename: CreateAccountDTO.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 4/6/2026
//
// Description: Data transfer object (DTO) for account creation information
// being sent to server after user submission.
//==============================================================================
namespace EmailApplication.Shared {
    public class CreateAccountDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public string EmailAddress { get; set; }
        public string AccountName { get; set; }
        public string Password { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================