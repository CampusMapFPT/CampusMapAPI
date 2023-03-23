using Application.IServices;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class LocationService : ILocationService
    {
        private readonly IUnitOfWork _unitOfWork;

        public LocationService(IUnitOfWork unitOfWork) 
        {
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<Location> GetDirections()
        {
            throw new NotImplementedException();
        }
    }
}
