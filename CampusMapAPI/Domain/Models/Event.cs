using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Event : BaseModel
    {
        public DateTime? CreateDate { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string? ImageUrl { get; set; }
        public string? Title { get; set; }
        public string? Unit { get; set; }
        public string? Time { get; set; }
        public string? Location { get; set; }
        public string? Header { get; set; }
        public string? Content { get; set; }

    }
}
