using Application.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class EventService : IEventService
    {
        private readonly IUnitOfWork _unitOfWork;

        public EventService(IUnitOfWork unitOfWork) 
        { 
            _unitOfWork = unitOfWork;
        }

        public async Task<IEnumerable<Event>> GetAllFutureEventAsync()
        {

            return await _unitOfWork.EventRepository
                .GetAllAsync(filter: x => x.StartDate > DateTime.UtcNow);
        }

        public async Task<IEnumerable<Event>> GetAllOnGoingEventAsync()
        {
            return await _unitOfWork.EventRepository
                .GetAllAsync(filter: x => x.EndDate > DateTime.UtcNow);
        }

        public async Task<Event> GetByIdAsync(int id)
        {
            var item = await _unitOfWork.EventRepository.GetByIdAsync(id) ??
                throw new KeyNotFoundException("Not found");

            return item;
        }
        public async Task<Event> GetLastestEventAsync()
        {
            var list = await _unitOfWork.EventRepository.GetAllAsync() ??
                throw new KeyNotFoundException("Not found");
            var item = list.MaxBy(x => x.CreateDate);
            return item;
        }
    }
}
