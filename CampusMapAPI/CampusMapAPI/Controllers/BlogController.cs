using Application.IServices;
using Application.ResponseModels;
using Application.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogController : ControllerBase
    {
        private readonly IBlogService _blogService;

        public BlogController(IBlogService blogService)
        {
            _blogService = blogService;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var list = await _blogService.GetAllAsync();
                return Ok(new BaseResponseModel()
                {
                    Status = Ok().StatusCode,
                    Message = "Get all blog success",
                    Result = list
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(Guid id)
        {
            try
            {
                var item = await _blogService.GetByIdAsync(id);
                return Ok(new BaseResponseModel()
                {
                    Status = Ok().StatusCode,
                    Message = $"Get blog with {id} success",
                    Result = item
                });
            }
            catch (KeyNotFoundException ex)
            {
                return NotFound(new BaseFailedResponseModel
                {
                    Status = NotFound().StatusCode,
                    Message = ex.Message,
                    Errors = ex
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
