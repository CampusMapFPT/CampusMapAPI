using Application.IServices;
using Application.ResponseModels;
using Application.Services;
using Application.ViewModels.Feedback;
using Domain.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeedbackController : ControllerBase
    {
        private readonly IFeedbackService _feedbackService;

        public FeedbackController(IFeedbackService feedbackService)
        {
            _feedbackService = feedbackService;
        }

        [HttpPost]
        public async Task<IActionResult> SendNewFeedback(FeedbackAddVM feedbackVM)
        {
            try
            {
                await _feedbackService.AddNewFeedbackAsync(feedbackVM);
                return Ok(new BaseResponseModel
                {
                    Status = 200,
                    Message = "Send feedback success",
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new BaseFailedResponseModel
                {
                    Status = BadRequest().StatusCode,
                    Message = ex.Message,
                    Errors = ex
                });
            }
        }
    }
}
