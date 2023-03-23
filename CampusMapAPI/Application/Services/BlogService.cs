using Application.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class BlogService : IBlogService
    {
        private readonly IUnitOfWork _unitOfWork;

        public BlogService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IEnumerable<Blog>> GetAllAsync()
        {
            return await _unitOfWork.BlogRepository.GetAllAsync();
        }

        public async Task<Blog> GetByIdAsync(Guid id)
        {
            var item = await _unitOfWork.BlogRepository.GetByIdAsync(id) ??
                throw new KeyNotFoundException("Not found");

            return item;
        }
    }
}
