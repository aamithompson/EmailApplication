//==============================================================================
// Filename: FileAttachmentController.cs
// Author: Aaron Thompson
// Date Created: 4/29/2026
// Last Updated: 4/29/2026
//
// Description: Handles processing incoming http requests relating to files.
//==============================================================================
using EmailApplication.Enums;
using EmailApplication.Server.Services.Files;
using EmailApplication.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
//------------------------------------------------------------------------------
namespace EmailApplication.Server.Controllers {
    [ApiController]
    [Route("api/[controller]")]
    public class FileAttachmentController : ControllerBase {

// VARIABLE(s)
//------------------------------------------------------------------------------
        private readonly IFileService _fileService;

// CONSTRUCTOR(s)
//------------------------------------------------------------------------------
        public FileAttachmentController(IFileService fileService) {
            _fileService = fileService;
        }

// HTTP FUNCTION(s)
//------------------------------------------------------------------------------
        [Authorize]
        [HttpGet("get/file/{fileID}")]
        public IActionResult GetFileAttachmentURL(int fileID) {
            var result = _fileStorage.GetFileAttachmentURL(fileID);
            return Ok(result);
        }

        [Authorize]
        [HttpPost("upload/file")]
        public async Task<IActionResult> UploadFileAttachment(IFormFile file) {
            if(file == null || file.Length == 0) {
                return BadRequest("No file provided");
            }

            int accountID = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);

            var result = await _fileService.UploadFileAttachment(
                file.OpenReadStream(),
                file.FileName,
                file.ContentType,
                accountID
            );

            return Ok(result);
        }
    }
} //END NAMESPACE EmailApplication.Services.Controllers
//==============================================================================
//==============================================================================