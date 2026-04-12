//==============================================================================
// Filename: LoginResponse.cs
// Author: Aaron Thompson
// Date Created: 3/31/2026
// Last Updated: 3/31/2026
//
// Description: Enum for login attempt responses. Non-Positive is failure.
//==============================================================================
namespace EmailApplication.Enums {
    public enum LoginResponse {
        TooManyRequests = -2,
        NotFound = -1,
        TimeOut = 0,
        Successful = 1,
    }
} //END NAMESPACE EmailApplication.Enums
//==============================================================================
//==============================================================================