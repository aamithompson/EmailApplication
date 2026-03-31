using System;
using System.Collections.Generic;
using System.Text;

namespace EmailApplication.Enums {
    public enum LoginResponse {
        TooManyRequests = -2,
        NotFound = -1,
        TimeOut = 0,
        Succesful = 1,
    }
}
