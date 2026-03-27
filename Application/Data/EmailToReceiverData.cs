using EmailApplication.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Data {
    public class EmailToReceiverData {
        public int MailID { get; set; } //FOREIGN KEY
        public int ReceiverID { get; set; } //FOREIGN KEY
        public EmailStatus MailStatus { get; set; }
        public bool Marked { get; set; }
        public bool Trashed { get; set; }
        public DateTime? DateTrashed { get; set; }
        public DateTime DateSent { get; set; }
        public DateTime? DateReceived { get; set; }
        public DateTime? DateRead { get; set; }
    }
}
