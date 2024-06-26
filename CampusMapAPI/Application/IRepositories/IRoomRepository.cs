﻿using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.IRepositories
{
    public interface IRoomRepository : IGenericRepository<Room>
    {
        Task<Room> GetByIdAsync(int id);
    }
}
