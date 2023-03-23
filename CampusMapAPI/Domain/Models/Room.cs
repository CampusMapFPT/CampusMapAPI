using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Room
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? SecondName { get; set; }
        public string? Type { get; set; }
        public string? ActiveTime { get; set; }

        public int LocationId { get; set; }
        public Location Location { get; set; }
    }
}
