using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Location
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public int XCoordinate { get; set; }
        public int YCoordinate { get; set; }
        public int? XRenderValue { get; set; }
        public int? YRenderValue { get; set; }
        public int? Floor { get; set; }

        public virtual ICollection<Room> Rooms { get; set; }
    }
}
