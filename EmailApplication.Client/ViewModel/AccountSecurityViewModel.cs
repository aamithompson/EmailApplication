//==============================================================================
// Filename: AccountSecurityViewModel.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 3/10/2026
//
// Description: View Model for a profile that is being changed. This is a
// security oriented view model.
//==============================================================================
namespace EmailApplication.Client.ViewModel {
    public class AccountSecurityViewModel {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public string CurrentPassword { get; set; } //plaintext, entered by user
        public string NewPassword { get; set; } //plaintext, entered by user
        public string ComfirmedNewPassword { get; set; } //plaintext, entered by user
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================