//==============================================================================
// Filename: EmailMapper.cs
// Author: Aaron Thompson
// Date Created: 4/6/2026
// Last Updated: 4/9/2026
//
// Description: Translation of email DTOs and VMs both ways. Implemented as a
// static class.
//==============================================================================
using EmailApplication.Shared;
using EmailApplication.Client.ViewModel;
//------------------------------------------------------------------------------
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

        public static void PopulateEmailViewModelFromEmailDTO(EmailDTO dto, EmailViewModel vm) {
            vm.Subject = dto.Subject;
            vm.Sender = dto.SenderEmail;
            vm.Recipients = dto.Recipients;
            vm.Body = dto.Body;
            vm.DateCreated = dto.DateCreated;
            vm.DateReceived = dto.DateReceived;
            vm.DateRead = dto.DateRead;
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
} //END NAMESPACE EmailApplication.Client.Mapper
//==============================================================================
//==============================================================================