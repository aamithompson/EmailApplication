using System;
using System.Collections.Generic;
using System.Text;

namespace EmailApplication.Shared {
    public class InboxEmailDTO {
        public int MailID { get; set; }
        public string Sender { get; set; }
        public string Subject { get; set; }
        public string Preview { get; set; }
        public DateTime? DateReceived { get; set; }
        public DateTime? DateRead { get; set; }
    }
}
