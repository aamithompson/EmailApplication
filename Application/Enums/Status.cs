using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Enums {
    public enum EmailStatus {
        Failed = -1,
        Draft = 0,
        Sending = 1,
        Sent = 2,
        Received = 3,
        Read = 4,
    }
}
