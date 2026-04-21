//==============================================================================
// Filename: InboxCache.cs
// Author: Aaron Thompson
// Date Created: 4/20/2026
// Last Updated: 4/21/2026
//
// Description: Handles the cache logic for the inbox.
//==============================================================================
using EmailApplication.Client.APIServices;
using EmailApplication.Client.ViewModel;
using EmailApplication.Shared;
using System.Net.Http;

namespace EmailApplication.Client {

    public class InboxCache {
// VARIABLE(s)
//------------------------------------------------------------------------------
        private IEmailAPIService _emailAPIService;
        private const int _DEFAULTINCREASECOUNT = 30;
        private const int _DEFAULTSTARTCOUNT = 30;

        public InboxViewModel InboxVMCache { get; private set; }

        private DateTime timeStamp;
        private DateTime dbTimeStamp;
        private int count;
        private int dbCount;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public InboxCache(IEmailAPIService emailAPIService) {
            _emailAPIService = emailAPIService;

            InboxVMCache = new InboxViewModel();
            count = _DEFAULTSTARTCOUNT;
        }

// FUNCTION(s)
//------------------------------------------------------------------------------
        public async Task<bool> RefreshInbox(bool check=true) {
            bool isUpToDate = false;
            if(check) {
                isUpToDate = await IsUpToDate();
            }

            if(!isUpToDate) {
                try {
                    List<InboxEmailDTO> dtos = await _emailAPIService.GetInbox(0, count-1);
                    if (dtos != null) {
                        InboxVMCache.Emails.Clear();
                        for (int i = 0; i < dtos.Count; i++) {
                            InboxVMCache.Emails.Add(new InboxEmailViewModel {
                                MailID = dtos[i].MailID,
                                Sender = dtos[i].Sender,
                                Subject = dtos[i].Subject,
                                Preview = dtos[i].Preview,
                                DateReceived = dtos[i].DateReceived,
                                IsRead = (dtos[i].DateRead != null)
                            });
                        }
                    }

                    timeStamp = dbTimeStamp;
                    return true;
                } catch (HttpRequestException) {

                } catch (Exception ex) {

                }
            } else {
                return true;
            }

            return false;
        }

        //Potential bug where count overflows.
        public async Task<bool> IncreaseCount(int icount = _DEFAULTINCREASECOUNT) {
            bool isUpToDate = await IsUpToDate();
            if(count >= dbCount) {
                return false;
            }

            count += icount;
            if(!isUpToDate) {
                return await RefreshInbox(false);
            } else {
                try {
                    List<InboxEmailDTO> dtos = await _emailAPIService.GetInbox(count-icount, count-1);
                    if (dtos != null) {
                        for (int i = 0; i < dtos.Count; i++) {
                            InboxVMCache.Emails.Add(new InboxEmailViewModel {
                                MailID = dtos[i].MailID,
                                Sender = dtos[i].Sender,
                                Subject = dtos[i].Subject,
                                Preview = dtos[i].Preview,
                                DateReceived = dtos[i].DateReceived,
                                IsRead = (dtos[i].DateRead != null)
                            });
                        }
                    }

                    timeStamp = dbTimeStamp;
                    return true;
                } catch (HttpRequestException) {

                } catch (Exception ex) {

                }
            }

            return false;
        }

        private async Task<bool> IsUpToDate() {
            try {
                AccountInboxStateDTO dto = await _emailAPIService.GetInboxStatus();
                dbTimeStamp = dto.DateLastModified;
                dbCount = dto.MailCount;
                return timeStamp >= dbTimeStamp;
            } catch (HttpRequestException) {

            } catch (Exception ex) {

            }

            return false;
        }
    }

} //END NAMESPACE EmailApplication.Client
//==============================================================================
//==============================================================================