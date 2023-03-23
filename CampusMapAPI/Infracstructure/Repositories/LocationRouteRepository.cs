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
    public class LocationRouteRepository : GenericRepository<LocationRoute>, ILocationRouteRepository
    {
        DbSet<LocationRoute> _locationRoutes;
        public LocationRouteRepository(AppDbContext context) : base(context)
        {
            _locationRoutes = context.LocationRoutes;
        }
        public async Task<List<LocationRoute>> GetAllAsync() => 
            await _locationRoutes
                .Include(x => x.FirstLocation)
                .Include(x => x.SecondLocation)
                .ToListAsync();
    }
}
