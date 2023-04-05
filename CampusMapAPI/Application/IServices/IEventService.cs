using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.IServices
{
    public interface IEventService
    {
        Task<IEnumerable<Event>> GetAllOnGoingEventAsync();
        Task<IEnumerable<Event>> GetAllFutureEventAsync();
        Task<Event> GetByIdAsync(int id);
        Task<Event> GetLastestEventAsync();
    }
}
