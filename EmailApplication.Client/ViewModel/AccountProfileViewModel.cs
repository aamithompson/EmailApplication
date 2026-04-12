//==============================================================================
// Filename: AccountProfileViewModel.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 3/10/2026
//
// Description: View Model for a profile that is viewed. This is public facing.
//==============================================================================
namespace EmailApplication.Client.ViewModel {
    public class AccountProfileViewModel {
// VARIABLE(s)
//------------------------------------------------------------------------------
        public string EmailAddress { get; set; }
        public string Name { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateLastLogin { get; set; }
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================