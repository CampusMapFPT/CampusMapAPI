using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Location : BaseModel
    {
        public string Name { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public string IconUrl { get; set; }
        public string ActiveTime { get; set; }
        public int XCoordinate { get; set; }
        public int YCoordinate { get; set; }
        public int Floor { get; set; }

    }
}
