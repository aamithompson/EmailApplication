using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Data {
    public class AccountData {
        public int AccountID { get; set; } //PRIMARY KEY
        public string EmailAddress { get; set; }
        public string AccountName { get; set; }
        public string PasswordHash { get; set; } //Stored as algorithm$salt$hash
        public DateTime DateCreated { get; set; }
        public DateTime DateLastLogin { get; set; }
    }
}
