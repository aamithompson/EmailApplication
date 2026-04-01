using System;
using System.Collections.Generic;
using System.Text;

namespace EmailApplication.Shared {
    public class SendEmailDTO {
        public string Subject { get; set; }
        public List<string> Recipients { get; set; }
        public string Body { get; set; }
    }
}
