using System;
using System.Collections.Generic;
using System.Text;
using EmailApplication.Enums;

namespace EmailApplication.Shared {
    public class LoginResponseDTO {
        public string Token { get; set; }
        public string AccountName { get; set; }
        public string EmailAddress { get; set; }
        public LoginResponse Response { get; set; }
    }
}
