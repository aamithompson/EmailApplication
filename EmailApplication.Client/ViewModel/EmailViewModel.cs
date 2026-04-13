//==============================================================================
// Filename: EmailViewModel.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 4/9/2026
//
// Description: View Model for a full email.
//==============================================================================
namespace EmailApplication.Client.ViewModel {
    public class EmailViewModel : ViewModelBase {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private string _subject { get; set; }
        private string _sender { get; set; }
        private List<string> _recipients { get; set; }
        private string _body { get; set; }
        private DateTime _dateCreated { get; set; }
        private DateTime? _dateReceived { get; set; }
        private DateTime? _dateRead { get; set; }

        public string Subject { get => _subject;
            set {
                _subject = value;
                OnPropertyChanged(nameof(Subject));
            }
        }
        public string Sender { get => _sender;
            set {
                _sender = value;
                OnPropertyChanged(nameof(Sender));
            }
        }
        public List<string> Recipients { get => _recipients;
            set {
                _recipients = value;
                OnPropertyChanged(nameof(Recipients));
            }
        }
        public string Body { get => _body;
            set {
                _body = value;
                OnPropertyChanged(nameof(Body));
            }
        }
        public DateTime DateCreated { get => _dateCreated;
            set {
                _dateCreated = value;
                OnPropertyChanged(nameof(DateCreated));
            }
        }
        public DateTime? DateReceived { get => _dateReceived;
            set {
                _dateReceived = value;
                OnPropertyChanged(nameof(DateReceived));
            }
        }
        public DateTime? DateRead { get => _dateRead;
            set {
                _dateRead = value;
                OnPropertyChanged(nameof(DateRead));
            }
        }
    }
} //END NAMESPACE EmailApplication.Client.ViewModel
//==============================================================================
//==============================================================================