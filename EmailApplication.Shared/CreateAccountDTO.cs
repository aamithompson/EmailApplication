using System;
using System.Collections.Generic;
using System.Text;

namespace EmailApplication.Shared {
    public class CreateAccountDTO {
        public string EmailAddress { get; set; }
        public string AccountName { get; set; }
        public string Password { get; set; }
    }
}
