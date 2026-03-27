using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Data {
    public class BlacklistedToAccountData {
        public int BlacklistFrom { get; set; } //FOREIGN KEY
        public int BlacklistTo { get; set; } //FOREIGN KEY
    }
}
