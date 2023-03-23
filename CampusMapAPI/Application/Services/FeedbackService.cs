using Application.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class FeedbackService : IFeedbackService
    {
        private IUnitOfWork _unitOfWork;

        public FeedbackService(IUnitOfWork unitOfWork) 
        {
            _unitOfWork = unitOfWork;
        }

        public async Task AddNewFeedbackAsync(Feedback feedback)
        {
            await _unitOfWork.FeedbackRepository.AddAsync(feedback);
        }
    }
}
