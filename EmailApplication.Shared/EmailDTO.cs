//==============================================================================
// Filename: EmailDTO.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 4/1/2026
//
// Description: Data transfer object (DTO) for full emails being sent to client
// after user request.
//==============================================================================
using EmailApplication.Enums;
//------------------------------------------------------------------------------
namespace EmailApplication.Shared {
    public class EmailDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        //From EmailData
        public int MailID { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public DateTime DateCreated { get; set; }

        //From AccountData (sender)
        public string SenderName { get; set; }
        public string SenderEmail { get; set; }

        //From EmailToReceiverData
        public EmailStatus MailStatus { get; set; }
        public bool Marked { get; set; }
        public bool Trashed { get; set; }
        public DateTime DateSent { get; set; }
        public DateTime? DateReceived { get; set; }
        public DateTime? DateRead { get; set; }

        //From EmailToReceiverData and AccountData (recipients)
        public List<string> Recipients { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================