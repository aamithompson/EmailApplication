using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.ViewModel {
    //For account settings changes
    public class AccountSecurityViewModel {
        public string CurrentPassword { get; set; } //plaintext, entered by user
        public string NewPassword { get; set; } //plaintext, entered by user
        public string ComfirmedNewPassword { get; set; } //plaintext, entered by user
    }
}
