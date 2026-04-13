//==============================================================================
// Filename: EmailToReceiverData.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 3/31/2026
//
// Description: Data object for database access
//==============================================================================
using EmailApplication.Enums;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Data {
    public class EmailToReceiverData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int MailID { get; set; } //FOREIGN KEY
        public int ReceiverID { get; set; } //FOREIGN KEY
        public EmailStatus MailStatus { get; set; }
        public bool Marked { get; set; }
        public bool Trashed { get; set; }
        public DateTime? DateTrashed { get; set; }
        public DateTime DateSent { get; set; }
        public DateTime? DateReceived { get; set; }
        public DateTime? DateRead { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================