//==============================================================================
// Filename: EmailController.cs
// Author: Aaron Thompson
// Date Created: 3/31/2026
// Last Updated: 4/20/2026
//
// Description: Handles processing incoming http requests relating to emails
// and returns a response.
//==============================================================================
using EmailApplication.Server.Services;
using EmailApplication.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Controllers {

    [ApiController]
    [Route("api/[controller]")]
    public class EmailController : ControllerBase {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IEmailService _emailService;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public EmailController(IEmailService emailService) {
            _emailService = emailService;
        }

// HTTP FUNCTION(s)
//------------------------------------------------------------------------------
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
        [HttpGet("get/inbox/{a}/{b}")]
        public IActionResult GetInbox(int a = -1, int b = -1) {
            GetInboxDTO dto = new GetInboxDTO{query=""};
            int accountID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            var result = _emailService.GetInbox(dto, accountID, a, b);
            return Ok(result);
        }

        [Authorize]
        [HttpGet("get/inboxstatus")]
        public IActionResult GetInboxStatus() {
            int accountID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            int category = 0;
            var result = _emailService.GetInboxStatus(accountID, category);
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
} //END NAMESPACE EmailApplication.Services.Controllers
//==============================================================================
//==============================================================================