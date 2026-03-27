using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.ViewModel {
    public class EmailViewModel {
        public string Subject { get; set; }
        public string Sender { get; set; }
        public List<string> Recipients { get; set; }
        public string Body { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? DateReceived { get; set; }
        public DateTime? DateRead { get; set; }
    }
}
