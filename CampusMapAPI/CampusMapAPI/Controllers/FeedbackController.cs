﻿using Application.IServices;
using Application.ResponseModels;
using Application.Services;
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
        public async Task<IActionResult> SendNewFeedback(Feedback feedback)
        {
            try
            {
                await _feedbackService.AddNewFeedbackAsync(feedback);
                return Created("api/feedback", new BaseResponseModel
                {
                    Status = 201,
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
