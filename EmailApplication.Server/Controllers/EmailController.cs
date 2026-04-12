using EmailApplication.Services;
using EmailApplication.Shared;
using Microsoft.AspNetCore.Authorization;
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

        [HttpGet("test")]
        public IActionResult Test() {
            return Ok("EmailController is reachable");
        }

        [Authorize]
        [HttpGet("get/email/{mailID}")]
        public IActionResult GetEmail(int mailID) {
            int requesterID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var result = _emailService.GetEmail(mailID, requesterID);
            return Ok(result);
        }

        [Authorize]
        [HttpGet("get/inbox")]
        public IActionResult GetInbox() {
            GetInboxDTO dto = new GetInboxDTO{query=""};
            int accountID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var result = _emailService.GetInbox(dto, accountID);
            return Ok(result);
        }

        [Authorize]
        [HttpPost("send/email")]
        public IActionResult SendEmail([FromBody] SendEmailDTO dto) {
            int senderID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var result = _emailService.SendEmail(dto, senderID);
            return Ok(result);
        }
    }
}
