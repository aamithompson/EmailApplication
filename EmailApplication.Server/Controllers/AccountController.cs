//==============================================================================
// Filename: AccountController.cs
// Author: Aaron Thompson
// Date Created: 3/31/2026
// Last Updated: 4/7/2026
//
// Description: Handles processing incoming http requests relating to accounts
// and returns a response.
//==============================================================================
using EmailApplication.Enums;
using EmailApplication.Services;
using EmailApplication.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Controllers {

    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IAccountService _accountService;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public AccountController(IAccountService accountService) {
            _accountService = accountService;
        }

// HTTP FUNCTION(s)
//------------------------------------------------------------------------------
        [Authorize]
        [HttpGet("/get/account/{accountID}")]
        public IActionResult GetAccount(int accountID) {
            var result = _accountService.GetAccount(accountID);
            return Ok(result);
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] SendAccountLoginDTO dto) {
            var result = _accountService.Login(dto);
            
            if(result.Response == LoginResponse.Successful) {
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
} //END NAMESPACE EmailApplication.Services.Controllers
//==============================================================================
//==============================================================================