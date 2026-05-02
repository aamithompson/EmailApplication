//==============================================================================
// Filename: EmailMapper.cs
// Author: Aaron Thompson
// Date Created: 4/6/2026
// Last Updated: 5/2/2026
//
// Description: Translation of email DTOs and VMs both ways. Implemented as a
// static class.
//==============================================================================
using EmailApplication.Client.ViewModel;
using EmailApplication.Shared;
using System.Collections.ObjectModel;
using System.Text.RegularExpressions;
//------------------------------------------------------------------------------
namespace EmailApplication.Client.Mapper {
    public static class EmailMapper {
        public static EmailViewModel EmailDTOToEmailViewModel(EmailDTO dto) {
            ObservableCollection<FileAttachmentURLViewModel> fileAttachmentURLs = new ObservableCollection<FileAttachmentURLViewModel>();
            for(int i = 0; i < dto.FileIDs.Count; i++) {
                fileAttachmentURLs.Add(new FileAttachmentURLViewModel {
                    FileID = dto.FileIDs[i],
                    FileName = dto.FileNames[i]
                });
            }

            return new EmailViewModel {
                Subject = dto.Subject,
                Sender = dto.SenderEmail,
                Recipients = dto.Recipients,
                Body = dto.Body,
                DateCreated = dto.DateCreated,
                DateReceived = dto.DateReceived,
                DateRead = dto.DateRead,
                FileAttachmentURLs = fileAttachmentURLs
            };
        }

        public static void PopulateEmailViewModelFromEmailDTO(EmailDTO dto, EmailViewModel vm) {
            vm.FileAttachmentURLs.Clear();
            for(int i = 0; i < dto.FileIDs.Count; i++) {
                vm.FileAttachmentURLs.Add(new FileAttachmentURLViewModel {
                    FileID = dto.FileIDs[i],
                    FileName = dto.FileNames[i]
                });
            }

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
                Body = vm.Body,
                FileIDs = vm.FileAttachments.Select(fa => fa.FileID).ToList(),
            };
        }
    }
} //END NAMESPACE EmailApplication.Client.Mapper
//==============================================================================
//==============================================================================