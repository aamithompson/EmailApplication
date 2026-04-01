using EmailApplication.ViewModel;

namespace EmailApplication.ViewModel {
        public class CreateMailViewModel : ViewModelBase {
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
}