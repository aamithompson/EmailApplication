using System;
using System.Collections.Generic;
using System.Text;
using EmailApplication.Mapper;
using EmailApplication.Shared;
using EmailApplication.ViewModel;

namespace EmailApplication.Client.Mapper {
    public static class EmailMapper {
        public static EmailViewModel EmailDTOToEmailViewModel(EmailDTO dto) {
            return new EmailViewModel {
                Subject = dto.Subject,
                Sender = dto.SenderEmail,
                Recipients = dto.Recipients,
                Body = dto.Body,
                DateCreated = dto.DateCreated,
                DateReceived = dto.DateReceived,
                DateRead = dto.DateRead,
            };
        }

        public static InboxEmailViewModel InboxEmailDTOToInboxEmailViewModel(InboxEmailDTO dto) {
            return new InboxEmailViewModel {
                MailID = dto.MailID,
                Sender = dto.Sender,
                Subject = dto.Subject,
                Preview = dto.Preview,
                DateReceived = dto.DateReceived,
                IsRead = (dto.DateRead != null)
            };
        }

        public static SendEmailDTO CreateMailViewModelToSendEmailDTO(CreateMailViewModel vm) {
            return new SendEmailDTO {
                Subject = vm.Subject,
                Recipients = RecipientMapper.Map(vm.Recipients),
                Body = vm.Body
            };
        }
    }
}
