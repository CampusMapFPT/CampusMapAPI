using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class LocationRoute
    {
        public int Id { get; set; }
        public int FirstLocationId { get; set; }
        public int SecondLocationId { get; set; }
        public int? CustomDistance { get; set; } 
        public virtual Location FirstLocation { get; set; }
        public virtual Location SecondLocation { get; set; }
    }
}
