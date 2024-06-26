﻿using Application.IServices;
using Application.ResponseModels;
using Application.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventController : ControllerBase
    {
        private readonly IEventService _eventService;

        public EventController(IEventService eventService)
        {
            _eventService = eventService;
        }

        [HttpGet("future")]
        public async Task<IActionResult> GetFutureEvents()
        {
            try
            {
                var list = await _eventService.GetAllFutureEventAsync();
                return Ok(new BaseResponseModel()
                {
                    Status = Ok().StatusCode,
                    Message = "Get all event success",
                    Result = list
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

        [HttpGet("ongoing")]
        public async Task<IActionResult> GetOngoingEvents()
        {
            try
            {
                var list = await _eventService.GetAllOnGoingEventAsync();
                return Ok(new BaseResponseModel()
                {
                    Status = Ok().StatusCode,
                    Message = "Get all event success",
                    Result = list
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new BaseFailedResponseModel
                {
                    Status = BadRequest().StatusCode,
                    Message = ex.Message,
                });
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {
                var item = await _eventService.GetByIdAsync(id);
                return Ok(new BaseResponseModel()
                {
                    Status = Ok().StatusCode,
                    Message = $"Get event with {id} success",
                    Result = item
                });
            }
            catch (KeyNotFoundException ex)
            {
                return NotFound(new BaseFailedResponseModel
                {
                    Status = NotFound().StatusCode,
                    Message = ex.Message,
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new BaseFailedResponseModel
                {
                    Status = BadRequest().StatusCode,
                    Message = ex.Message,
                });
            }
        }

        [HttpGet("latest")]
        public async Task<IActionResult> GetLastestEvent()
        {
            try
            {
                var item = await _eventService.GetLastestEventAsync();
                return Ok(new BaseResponseModel()
                {
                    Status = Ok().StatusCode,
                    Message = $"Get event success",
                    Result = item
                });
            }
            catch (KeyNotFoundException ex)
            {
                return NotFound(new BaseFailedResponseModel
                {
                    Status = NotFound().StatusCode,
                    Message = ex.Message,
                });
            }
        }
    }
}
