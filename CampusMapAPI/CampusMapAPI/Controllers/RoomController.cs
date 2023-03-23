using Application.IServices;
using Application.ResponseModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        private readonly IRoomService _roomService;

        public RoomController(IRoomService roomService)
        {
            _roomService = roomService;
        }

        [HttpGet("direction")]
        public async Task<IActionResult> GetDirection(int fromLocationId, int toLocationId)
        {
            try
            {
                var resultList = await _roomService.GetRoomDirections(fromLocationId, toLocationId);
                return Ok(new BaseResponseModel
                {
                    Status = Ok().StatusCode,
                    Message = "Find way sucess",
                    Result = new
                    {
                        step = resultList.Count(),
                        direction = resultList
                    }
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

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                var list = await _roomService.GetAllAsync();
                return Ok(new BaseResponseModel
                {
                    Status = Ok().StatusCode,
                    Message = "Get all success",
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
    }
}
