using EmailApplication.Services;
using EmailApplication.Shared;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EmailApplication.Server.Controllers {

    [ApiController]
    [Route("api/[controller]")]
    public class EmailController : ControllerBase {
        private readonly IEmailService _emailService;

        public EmailController(IEmailService emailService) {
            _emailService = emailService;
        }

        [HttpGet("get/email/{mailID}")]
        public IActionResult GetEmail(int mailID) {
            int requesterID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var result = _emailService.GetEmail(mailID, requesterID);
            return Ok(result);
        }

        [HttpGet("get/inbox")]
        public IActionResult GetInbox([FromBody] GetInboxDTO dto) {
            int accountID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var result = _emailService.GetInbox(dto, accountID);
            return Ok(result);
        }

        [HttpPost("send/email")]
        public IActionResult SendEmail([FromBody] SendEmailDTO dto) {
            int senderID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var result = _emailService.SendEmail(dto, senderID);
            return Ok(result);
        }
    }
}
