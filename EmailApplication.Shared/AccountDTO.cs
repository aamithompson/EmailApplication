using System;
using System.Collections.Generic;
using System.Text;

namespace EmailApplication.Shared {
    public class AccountDTO {
        public int AccountID { get; set; }
        public string EmailAddress { get; set; }
        public string AccountName { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateLastLogin { get; set; }
    }
}
