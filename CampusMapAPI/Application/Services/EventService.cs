﻿using Application.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
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

            var list = await _unitOfWork.EventRepository
                .GetAllAsync(filter: x => 
                DateTime.Compare((DateTime)x.StartDate,DateTime.UtcNow) > 0
                && DateTime.Compare((DateTime)x.StartDate, DateTime.UtcNow) > 0);
            var sortedList = list.OrderBy(x => x.StartDate);
            return sortedList;
        }

        public async Task<IEnumerable<Event>> GetAllOnGoingEventAsync()
        {
            var list = await _unitOfWork.EventRepository
                .GetAllAsync(filter: x => 
                DateTime.Compare((DateTime)x.StartDate, DateTime.UtcNow) < 0);
            var sortedList = list.OrderByDescending(x => x.EndDate);

            return sortedList;
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
