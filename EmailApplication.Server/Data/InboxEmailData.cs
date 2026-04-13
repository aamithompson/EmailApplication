//==============================================================================
// Filename: InboxEmailData.cs
// Author: Aaron Thompson
// Date Created: 3/18/2026
// Last Updated: 3/18/2026
//
// Description: Data object for database access. Not a domain object but created
// for optimization for retreiving the inbox email previews since they can
// hundreds or even thousands. It is an intersection of EmailToReceiver, Email,
// and Account.
//==============================================================================
namespace EmailApplication.Server.Data {
    public class InboxEmailData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int MailID { get; set; }
        public string Sender { get; set; }
        public string Subject { get; set; }
        public string Preview { get; set; }
        public DateTime? DateReceived { get; set; }
        public DateTime? DateRead { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================