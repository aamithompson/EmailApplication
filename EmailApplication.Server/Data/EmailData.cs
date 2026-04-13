//==============================================================================
// Filename: EmailData.cs
// Author: Aaron Thompson
// Date Created: 3/10/2026
// Last Updated: 3/10/2026
//
// Description: Data object for database access
//==============================================================================
namespace EmailApplication.Server.Data {
    public class EmailData {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public int MailID { get; set; } //PRIMARY KEY
        public int SenderID { get; set; } //FOREIGN KEY
        public string Subject { get; set; }
        public string Body { get; set; }
        public DateTime DateCreated { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Data
//==============================================================================
//==============================================================================