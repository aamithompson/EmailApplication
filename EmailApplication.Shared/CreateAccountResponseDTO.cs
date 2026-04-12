//==============================================================================
// Filename: CreateAccountResponseDTO.cs
// Author: Aaron Thompson
// Date Created: 3/31/2026
// Last Updated: 3/31/2026
//
// Description: Data transfer object (DTO) for account creation response
// being sent to client after user submission.
//==============================================================================
using EmailApplication.Enums;
//------------------------------------------------------------------------------
namespace EmailApplication.Shared {
    public class CreateAccountResponseDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public AccountCreationResponse Response { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================