//==============================================================================
// Filename: InboxViewModel.cs
// Author: Aaron Thompson
// Date Created: 3/19/2026
// Last Updated: 4/9/2026
//
// Description: View Model for an entire inbox. Contains a list of Inbox Email
// View Models.
//==============================================================================
using System.Collections.ObjectModel;

namespace EmailApplication.Client.ViewModel {
    public class InboxViewModel : ViewModelBase {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public ObservableCollection<InboxEmailViewModel> Emails { get; set; } = new ObservableCollection<InboxEmailViewModel>();

        public string Search { get; set; }
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================