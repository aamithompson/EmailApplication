//==============================================================================
// Filename: InboxEmailViewModel.cs
// Author: Aaron Thompson
// Date Created: 3/18/2026
// Last Updated: 3/18/2026
//
// Description: View Model for email previews which are listed in the inbox.
//==============================================================================
namespace EmailApplication.Client.ViewModel {
    public class InboxEmailViewModel {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int MailID { get; set; }
        public string Sender { get; set; }
        public string Subject { get; set; }
        public string Preview { get; set; }
        public DateTime? DateReceived { get; set; }
        public bool IsRead { get; set; }
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================