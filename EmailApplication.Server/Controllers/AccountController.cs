using EmailApplication.Enums;
using EmailApplication.Services;
using EmailApplication.Shared;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.InteropServices;
using System.Security.Claims;

namespace EmailApplication.Server.Controllers {

    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase {
        private readonly IAccountService _accountService;

        public AccountController(IAccountService accountService) {
            _accountService = accountService;
        }

        [HttpGet("/get/account/{accountID}")]
        public IActionResult GetAccount(int accountID) {
            var result = _accountService.GetAccount(accountID);
            return Ok(result);
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] SendAccountLoginDTO dto) {
            var result = _accountService.Login(dto);
            
            if(result.Response == LoginResponse.Succesful) {
                return Ok(result);
            }

            return Unauthorized(result);
        }

        [HttpPost("create")]
        public IActionResult CreateAccount([FromBody] CreateAccountDTO dto) {
            var result = _accountService.CreateAccount(dto);

            if(result.Response == AccountCreationResponse.Success) {
                return Ok(result);
            }

            return Conflict(result);
        }
    }
}
