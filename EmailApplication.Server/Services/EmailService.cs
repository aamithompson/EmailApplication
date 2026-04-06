using EmailApplication.Data;
using EmailApplication.Enums;
using EmailApplication.Repositories;
using EmailApplication.Shared;

namespace EmailApplication.Services {
    public interface IEmailService {
        EmailDTO GetEmail(int mailID, int requesterID);
        List<InboxEmailDTO> GetInbox(GetInboxDTO dto, int accountID);
        bool SendEmail(SendEmailDTO dto, int senderID);
    }

    public class EmailService : IEmailService {
        private readonly IEmailRepository _emailRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IEmailRoReceiverRepository _emailRoReceiverRepository;
        private readonly IInboxEmailRepository _inboxEmailRepository;
        private readonly IConfiguration _configuration;

        public EmailService(IEmailRepository emailRepository, IAccountRepository accountRepository, IEmailRoReceiverRepository emailRoReceiverRepository, IInboxEmailRepository inboxEmailRepository, IConfiguration configuration) {
            _emailRepository = emailRepository;
            _accountRepository = accountRepository;
            _emailRoReceiverRepository = emailRoReceiverRepository;
            _inboxEmailRepository = inboxEmailRepository;
            _configuration = configuration;
        }

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

        public List<InboxEmailDTO> GetInbox(GetInboxDTO dto, int accountID) {
            List<InboxEmailDTO> output = new List<InboxEmailDTO>();
            List<InboxEmailData> data = _inboxEmailRepository.GetInboxEmailDatas(accountID);

            output.Capacity = data.Count;
            for(int i = 0; i < data.Count; i++) {
                output.Add(new InboxEmailDTO {
                    MailID = data[i].MailID,
                    Sender = data[i].Sender,
                    Subject = data[i].Subject,
                    Preview = data[i].Preview,
                    DateReceived = data[i].DateReceived,
                    //IsRead = data[i].DateRead != null
                });
            }

            return output;
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
}
