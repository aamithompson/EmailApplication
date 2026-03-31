using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Data {
    public class EmailData {
        public int MailID { get; set; } //PRIMARY KEY
        public int SenderID { get; set; } //FOREIGN KEY
        public string Subject { get; set; }
        public string Body { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
