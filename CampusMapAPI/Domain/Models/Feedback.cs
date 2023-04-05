using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    [Keyless]
    public class Feedback
    {
        public int Id { get; set; }
        public int Ratings { get; set; }
        public string CreateDate { get; set; }
        public string Content { get; set; }
    }
}
