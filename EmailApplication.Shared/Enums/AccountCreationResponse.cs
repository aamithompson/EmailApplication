using System;
using System.Collections.Generic;
using System.Text;

namespace EmailApplication.Enums {
    public enum AccountCreationResponse {
        TooManyRequests = -2,
        AddressAlreadyExists = -1,
        TimeOut = 0,
        Success = 1,
    }
}
