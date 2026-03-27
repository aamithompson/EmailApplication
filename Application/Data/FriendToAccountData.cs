using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Data {
    public class FriendToAccountData {
        public int FriendFrom { get; set; } //FOREIGN KEY
        public int FriendTo { get; set; } //FOREIGN KEY
    }
}
