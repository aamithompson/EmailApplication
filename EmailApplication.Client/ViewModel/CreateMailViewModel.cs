//==============================================================================
// Filename: CreateMailViewModel.cs
// Author: Aaron Thompson
// Date Created: 3/23/2026
// Last Updated: 3/26/2026
//
// Description: View Model for submitting an email.
//==============================================================================
namespace EmailApplication.Client.ViewModel {
    public class CreateMailViewModel : ViewModelBase {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private string _subject;
        private string _recipients;
        private string _body;
        public string Subject {
            get => _subject;
            set {
                _subject = value;
                OnPropertyChanged(nameof(Subject));
            }
        }

        public string Recipients {
            get => _recipients;
            set {
                _recipients = value;
                OnPropertyChanged(nameof(Recipients));
            }
        }

        public string Body {
            get => _body;
            set {
                _body = value;
                OnPropertyChanged(nameof(Body));
            }
        }

        public string Sender { get; set; }
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================