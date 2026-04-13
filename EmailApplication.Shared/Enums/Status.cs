//==============================================================================
// Filename: Status.cs
// Author: Aaron Thompson
// Date Created: 3/31/2026
// Last Updated: 3/31/2026
//
// Description: Enum for the transit status of an email. This data is represented
// in the EmailToReceiver table.
//==============================================================================
namespace EmailApplication.Enums {
    public enum EmailStatus {
        Failed = -1,
        Draft = 0,
        Sending = 1,
        Sent = 2,
        Received = 3,
        Read = 4,
    }
} //END NAMESPACE EmailApplication.Enums
//==============================================================================
//==============================================================================