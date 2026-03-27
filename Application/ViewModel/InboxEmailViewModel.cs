using System;

namespace EmailApplication.ViewModel {
    public class InboxEmailViewModel {
        public int MailID { get; set; }
        public string Sender { get; set; }
        public string Subject { get; set; }
        public string Preview { get; set; }
        public DateTime? DateReceived { get; set; }
        public bool IsRead { get; set; }
    }
}