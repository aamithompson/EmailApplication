//==============================================================================
// Filename: EmailService.cs
// Author: Aaron Thompson
// Date Created: 3/30/2026
// Last Updated: 4/20/2026
//
// Description: Email services which handles packaging information from the
// repositories and handles logic.
//==============================================================================
using EmailApplication.Server.Data;
using EmailApplication.Enums;
using EmailApplication.Server.Repositories;
using EmailApplication.Shared;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Services {
    public interface IEmailService {
        EmailDTO GetEmail(int mailID, int requesterID);
        List<InboxEmailDTO> GetInbox(GetInboxDTO dto, int accountID, int a = -1, int b = -1);
        AccountInboxStateDTO GetInboxStatus(int accountID, int category);
        bool SendEmail(SendEmailDTO dto, int senderID);
    }

    public class EmailService : IEmailService {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IEmailRepository _emailRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IEmailRoReceiverRepository _emailRoReceiverRepository;
        private readonly IInboxEmailRepository _inboxEmailRepository;
        private readonly IAccountInboxStatusRepository _accountInboxStatusRepository;
        private readonly IConfiguration _configuration;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public EmailService(IEmailRepository emailRepository, IAccountRepository accountRepository, IEmailRoReceiverRepository emailRoReceiverRepository, IInboxEmailRepository inboxEmailRepository, IAccountInboxStatusRepository accountInboxStatusRepository, IConfiguration configuration) {
            _emailRepository = emailRepository;
            _accountRepository = accountRepository;
            _emailRoReceiverRepository = emailRoReceiverRepository;
            _inboxEmailRepository = inboxEmailRepository;
            _accountInboxStatusRepository = accountInboxStatusRepository;
            _configuration = configuration;
        }

// SERVICE FUNCTION(s)
//------------------------------------------------------------------------------
        public EmailDTO GetEmail(int mailID, int requesterID) {
            EmailData emailData = _emailRepository.GetEmailByMailID(mailID);
            if(emailData == null) {
                return null;
            }

            AccountData senderData = _accountRepository.GetAccountDataByID(emailData.SenderID);
            List<EmailToReceiverData> receiverDatas = _emailRoReceiverRepository.GetReceiversByMailID(mailID);
            List<string> recipients = receiverDatas.Select(r => _accountRepository.GetAccountDataByID(r.ReceiverID).EmailAddress).ToList();
            EmailToReceiverData requesterData = receiverDatas.Single(r => r.ReceiverID == requesterID);

            return new EmailDTO {
                MailID = emailData.MailID,
                Subject = emailData.Subject,
                Body = emailData.Body,
                DateCreated = emailData.DateCreated,

                SenderName = senderData.AccountName,
                SenderEmail = senderData.EmailAddress,

                MailStatus = requesterData.MailStatus,
                Marked = requesterData.Marked,
                Trashed = requesterData.Trashed,
                DateSent = requesterData.DateSent,
                DateReceived = requesterData.DateReceived,
                DateRead = requesterData.DateRead,

                Recipients = recipients,
            };
        }

        public List<InboxEmailDTO> GetInbox(GetInboxDTO dto, int accountID, int a = -1, int b = -1) {
            List<InboxEmailDTO> output = new List<InboxEmailDTO>();
            List<InboxEmailData> data = _inboxEmailRepository.GetInboxEmailDatas(accountID, a, b);

            output.Capacity = data.Count;
            for(int i = 0; i < data.Count; i++) {
                output.Add(new InboxEmailDTO {
                    MailID = data[i].MailID,
                    Sender = data[i].Sender,
                    Subject = data[i].Subject,
                    Preview = data[i].Preview,
                    DateReceived = data[i].DateReceived,
                    DateRead = data[i].DateRead
                });
            }

            return output;
        }

        public AccountInboxStateDTO GetInboxStatus(int accountID, int category) {
            AccountInboxStateData accountInboxStateData = _accountInboxStatusRepository.GetAccountInboxState(accountID, category);
            if(accountInboxStateData == null) {
                return null;
            }

            return new AccountInboxStateDTO {
                StateID = accountInboxStateData.StateID,
                AccountID = accountInboxStateData.AccountID,
                Category = category,
                MailCount = accountInboxStateData.MailCount,
                DateLastModified = accountInboxStateData.DateLastModified,
            };
        }

        public bool SendEmail(SendEmailDTO dto, int senderID) {
            List<int> recipientIDs = dto.Recipients
                .Select(address => _accountRepository.GetAccountDataByEmailAddress(address)?.AccountID)
                .Where(id => id != null)
                .Select(id => id.Value)
                .ToList();

            if(recipientIDs.Count == 0) {
                return false;
            }

            EmailData emailData = new EmailData {
                SenderID = senderID,
                Subject = dto.Subject,
                Body = dto.Body,
                DateCreated = DateTime.Now
            };

            int mailID = _emailRepository.InsertEmail(emailData);
            if(mailID == 0) {
                return false;
            }

            DateTime dateSent = DateTime.Now;

            for(int i = 0; i < recipientIDs.Count; i++) {
                EmailToReceiverData emailToReceiverData = new EmailToReceiverData {
                    MailID = mailID,
                    ReceiverID = recipientIDs[i],
                    MailStatus = EmailStatus.Sent,
                    Marked = false,
                    Trashed = false,
                    DateTrashed = null,
                    DateSent = dateSent,
                    DateReceived = DateTime.Now,
                    DateRead = null,
                };

                _emailRoReceiverRepository.InsertEmailToReceiver(emailToReceiverData);
            }

            return true;
        }
    }
} //END NAMESPACE EmailApplication.Server.Services
//==============================================================================
//==============================================================================