//==============================================================================
// Filename: ViewModelBase.cs
// Author: Aaron Thompson
// Date Created: 3/23/2026
// Last Updated: 3/23/2026
//
// Description: Base for view models to enable on property changes.
//==============================================================================
using System.ComponentModel;
//------------------------------------------------------------------------------
namespace EmailApplication.Client.ViewModel {
    public class ViewModelBase : INotifyPropertyChanged {
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================