using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Data {
    //Not a domain object but created for optimization for retreiving the inbox email previews since they can hundreds or even thousands.
    //It is an intersection of EmailToReceiver, Email, and Account.
    public class InboxEmailData {
        public int MailID { get; set; }
        public string Sender { get; set; }
        public string Subject { get; set; }
        public string Preview { get; set; }
        public DateTime? DateReceived { get; set; }
        public DateTime? DateRead { get; set; }
    }
}