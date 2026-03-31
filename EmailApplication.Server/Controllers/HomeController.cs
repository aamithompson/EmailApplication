using EmailApplication.Services;
using EmailApplication.Shared;
using Microsoft.AspNetCore.Mvc;

namespace EmailApplication.Server.Controllers {
    public class AccountController : ControllerBase {
        private readonly IAccountService _accountService;

        public AccountController(IAccountService accountService) {
            _accountService = accountService;
        }

        [HttpPost("login")]
        public ActionResult Login([FromBody] SendAccountLoginDTO dto) {
            var result = _accountService.Login(dto.EmailAddress, dto.Password);
            return Ok(result);
        }

        [HttpPost("create")]
        public IActionResult CreateAccount([FromBody] CreateAccountDTO dto) {
            var result = _accountService.CreateAccount(dto);
            return Ok(result);
        }
    }
}
