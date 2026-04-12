//==============================================================================
// Filename: AccountCreationResponse.cs
// Author: Aaron Thompson
// Date Created: 3/31/2026
// Last Updated: 3/31/2026
//
// Description: Enum for account creation attempt responses. Non-Positive is
// failure.
//==============================================================================
namespace EmailApplication.Enums {
    public enum AccountCreationResponse {
        TooManyRequests = -2,
        AddressAlreadyExists = -1,
        TimeOut = 0,
        Success = 1,
    }
} //END NAMESPACE EmailApplication.Enums
//==============================================================================
//==============================================================================