using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Client {
    public class Session {
        public int AccountID { get; set; }
        public string AccountName { get; set; }
        public string EmailAddress { get; set; }
        public string Token { get; set; }
        public bool IsAuthenticated => !string.IsNullOrEmpty(Token);
    }
}
