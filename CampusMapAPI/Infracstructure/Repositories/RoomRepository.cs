using Application.IRepositories;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infracstructures.Repositories
{
    public class RoomRepository : GenericRepository<Room>,IRoomRepository
    {
        DbSet<Room> roomDbSet;
        public RoomRepository(AppDbContext context) : base(context)
        {
            roomDbSet = context.Set<Room>();
        }


        public async Task<Room> GetByIdAsync(int id) 
        {
            return await roomDbSet
                .Include(x => x.Location)
                .FirstOrDefaultAsync(x => x.Id == id);            
        }

        public async Task<List<Room>> GetAllAsync() => await _dbSet.Include(x => x.Location).ToListAsync();
    }
}
