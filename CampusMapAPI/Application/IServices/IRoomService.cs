using Application.ViewModels;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.IServices
{
    public interface IRoomService
    {
        Task<List<Room>> GetAllAsync();
        Task<List<DirectionGuideViewModel>> GetRoomDirections(int fromLocationId, int toLocationId);
    }
}
