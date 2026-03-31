using EmailApplication.Data;
using EmailApplication.Enums;
using EmailApplication.Repositories;
using EmailApplication.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace EmailApplication.Services {
    public interface IEmailService {
        EmailViewModel GetEmailViewModel(int mailID);
        List<InboxEmailViewModel> GetInboxEmailViewModels(int accountID);
    }

    public class EmailService : IEmailService {
        private readonly IEmailRepository _emailRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IEmailRoReceiverRepository _emailRoReceiverRepository;
        private readonly IInboxEmailRepository _inboxEmailRepository;

        public EmailService(IEmailRepository emailRepository, IAccountRepository accountRepository, IEmailRoReceiverRepository emailRoReceiverRepository, IInboxEmailRepository inboxEmailRepository) {
            _emailRepository = emailRepository;
            _accountRepository = accountRepository;
            _emailRoReceiverRepository = emailRoReceiverRepository;
            _inboxEmailRepository = inboxEmailRepository;
        }

        public EmailViewModel GetEmailViewModel(int mailID) {
            EmailData emailData = _emailRepository.GetEmailByMailID(mailID);
            if(emailData == null) {
                return null;
            }

            AccountData senderData = _accountRepository.GetAccountDataByID(emailData.SenderID);
            List<EmailToReceiverData> receiverDatas = _emailRoReceiverRepository.GetReceiversByMailID(mailID);
            List<string> recipients = receiverDatas.Select(r => _accountRepository.GetAccountDataByID(r.ReceiverID).EmailAddress).ToList();

            return new EmailViewModel {
                Subject = emailData.Subject,
                Sender = senderData.EmailAddress,
                Recipients = recipients,
                Body = emailData.Body,
                DateCreated = emailData.DateCreated,
                DateReceived = receiverDatas.FirstOrDefault()?.DateReceived,
                DateRead = receiverDatas.FirstOrDefault()?.DateRead
            };
        }

        public List<InboxEmailViewModel> GetInboxEmailViewModels(int accountID) {
            List<InboxEmailViewModel> output = new List<InboxEmailViewModel>();
            List<InboxEmailData> data = _inboxEmailRepository.GetInboxEmailDatas(accountID);

            output.Capacity = data.Count;
            for(int i = 0; i < data.Count; i++) {
                output.Add(new InboxEmailViewModel {
                    MailID = data[i].MailID,
                    Sender = data[i].Sender,
                    Subject = data[i].Subject,
                    Preview = data[i].Preview,
                    DateReceived = data[i].DateReceived,
                    IsRead = data[i].DateRead != null
                });
            }

            return output;
        }

        public bool SendEmail(string subject, int senderID, string recipients, string body) {
            recipients = Regex.Replace(recipients, @"\s+", "");
            List<string> recipientsAddresses = recipients.Split(',').ToList();
            List<int> recipientIDs = recipientsAddresses
                .Select(address => _accountRepository.GetAccountDataByEmailAddress(address)?.AccountID)
                .Where(id => id != null)
                .Select(id => id.Value)
                .ToList();

            if(recipientIDs.Count == 0) {
                return false;
            }

            EmailData emailData = new EmailData {
                SenderID = senderID,
                Subject = subject,
                Body = body,
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
